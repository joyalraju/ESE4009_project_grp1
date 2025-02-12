//Code for testing HC-SR04 ultrasonic sensor with Arduino UNO

//Define Trig an Echo Pin
#define trigPin 2
#define echoPin 3

//Define variables
long duration;
int distance;

void setup()
{
  //Define inputs and outputs
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  //Begin Serial communication at a baudrate of 9600
  Serial.begin(9600);
}

void loop()
{
  //Clear the trigPin by setting it LOW
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);

  //Trigger the sensor by setting the trigPin high for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  //Read the echoPin, pulseIn() returns the duration in microseconds
  duration = pulseIn(echoPin, HIGH);
  //Calculate the distance
  distance = duration * 0.034/2;

  //Print the distance on the Serial Monitor
  Serial.print("Object found at = ");
  Serial.print(distance);
  Serial.println(" cm");

  delay(50);  
}
