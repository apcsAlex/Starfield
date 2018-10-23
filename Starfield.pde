Particle[] bob;
Particle[] bob2;
void setup()
{
	size(500,500);
	bob = new NormalParticle[200];
	for (int i = 0; i < bob.length; i++)
	{
		bob[i] = new NormalParticle();
	}

	bob2 = new NormalParticle1[200];
	for (int i = 0; i < bob2.length; i++)
	{
		bob2[i] = new NormalParticle1();

	}
	bob[0] = new JumboParticle();
	bob[1] = new OddballParticle();

}
void draw()
{
	
	background(0);
	for(int i = 0; i < bob.length; i++)
	{
		
		bob[i].show();
		bob[i].walk();
		
	}
;
for (int i = 0; i < bob2.length; i++)
{
	
	bob2[i].show();
	bob2[i].walk();
}


}
class NormalParticle implements Particle
{
	double myX, myY, myAngle, mySpeed;
	NormalParticle()
	{
		myX = 250;
		myY = 250;
		myAngle = Math.PI*2*Math.random();
		mySpeed = (Math.random()*10);
	}
	void show()
	{
		fill(255);
		ellipse((float)myX,(float)myY,10,10);
	}
	void walk()
	{
		myX = myX + Math.cos(myAngle)*mySpeed;
		myY = myY + Math.sin(myAngle)*mySpeed;
		if(myX> 550)
		{
			myX = 250;
			myY = 250;
		}
		if(myX < -50)
		{
			myX = 250;
			myY = 250;
		}
		if(myY> 550)
		{
			myX = 250;
			myY = 250;
		}
		if(myY < -50)
		{
			myX = 250;
			myY = 250;
		}
	}

}
class NormalParticle1 extends NormalParticle
{	
	NormalParticle1()
	{
		myX = 150;
		myY = 150;
		mySpeed = (Math.random()*3);

	}
}
interface Particle
{
	public void show();
	public void walk();

}
class OddballParticle extends NormalParticle//uses an interface
{
	public void walk()
	{
		if(mouseX > myX)
      		myX = myX + (int)(Math.random()*5)-1;
    	else
      		myX = myX + (int)(Math.random()*5)-3;
    	if(mouseY > myY)
      		myY = myY + (int)(Math.random()*5)-1;
    	else
      		myY = myY + (int)(Math.random()*5)-3;
	}
	public void show()
	{
		fill((int)(Math.random()*265),(int) (Math.random()*265),(int)(Math.random()*265));
		ellipse(mouseX,mouseY, 30,30);
	}

}
class JumboParticle extends NormalParticle//uses inheritance
{
	public void show()
	{
		fill(197);
		ellipse((float)myX,(float)myY, 50,50);
	}

}


