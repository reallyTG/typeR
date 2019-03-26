library(easyreg)


### Name: regplot
### Title: Plot data and equation
### Aliases: regplot

### ** Examples

# weights of Angus cow at ages from 8 to 108 months (Kaps and Lamberson, 2009)

weight=c(280,340,430,480,550,580,590,600,590,600)
age=c(8,12,24,36,48,60,72,84,96,108)

data1=data.frame(age, weight)

# linear
regplot(data1, model=1, digits=3, position=3, ylab="weight", xlab="age")

# quadratic
regplot(data1, model=2, digits=3, position=3, col=1, ylim=c(200,700))

# linear plateau
regplot(data1, model=3,ylab="weight", xlab="age", lty=5, col="dark green",
position=3, ylim=c(200,700), xlim=c(0,150), lwd=2)

# quadratic plateau
regplot(data1, model=4,ylab="weight", xlab="age")

# two linear
regplot(data1, model=5, start=c(250,6,2,50),digits=3, position=3 )

# exponential
regplot(data1, model=6, start=c(250,0.05))

# logistic
regplot(data1, model=7, start=c(600,4,0.05))

# van bertalanffy
regplot(data1, model=8, start=c(600,2,0.05))

# brody
regplot(data1, model=9, start=c(600,4,0.05))

# gompertz
regplot(data1, model=10, start=c(600,4,0.05))



# growth of Zagorje turkeys (Kaps and Lamberson, 2009)


weight=c(44,66,100,150,265,370,455,605,770)
age=c(1,7,14,21,28,35,42,49,56)

data2=data.frame(age,weight)

# two linear
regplot(data2, model=5, start=c(25,6,10,20))


# weight gain measurements of turkey poults (Kaps and Lamberson, 2009)

methionine=c(80,85,90,95,100,105,110,115,120)
gain=c(102,115,125,133,140,141,142,140,142)

data3=data.frame(methionine, gain)

# linear
regplot(data3, model=1)

# quadratic
regplot(data3, model=2)

# linear plateau
regplot(data3, model=3)

# quadratic plateau
regplot(data3, model=4)

# lactation curve
 milk=c(25,24,26,28,30,31,27,26,25,24,23,24,22,21,22,20,21,19,
18,17,18,18,16,17,15,16,14)
 days=c(15,15,15,75,75,75,135,135,135,195,195,195,255,255,255,315,
315,315,375,375,375,435,435,435,495,495,495)
    
data4=data.frame(days,milk)
	

regplot(data4, model=11, start=c(16,0.25,0.004))

# ruminal degradation 
time=c(2,6,9,24,48,72,96)
deg=c(20,33,46,55,66,72,76)

data5=data.frame(time,deg)

regplot(data5, model=12)

# logistic bi-compartmental (gas production)
time=c(0,12,24,36,48,60,72,84,96,108,120,144,168,192)
gas=c(0.002,3.8,8,14.5,16,16.5,17,17.4,17.9,18.1,18.8,19,19.2,19.3)
    
data6=data.frame(time,gas)

regplot(data6, model=13, start=c(19,4,0.025,0.004,5))

# multiple curves
time=c(0,12,24,48,64,72,96)
t1=c(36,48,59,72,85,86,87)
t2=c(14,25,36,49,59,65,72)
t3=c(55,78,86,87,86,87,88)

data=data.frame(time,t1,t2,t3)

regplot(data, model=12)
regplot(data, model=4)

# include standard deviation in graph
data(data1)

regplot(data1, sd=TRUE)





