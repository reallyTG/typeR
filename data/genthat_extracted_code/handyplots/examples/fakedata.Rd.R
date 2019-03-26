library(handyplots)


### Name: fakedata
### Title: Fake Data
### Aliases: fakedata

### ** Examples

x=sample(0:1000,100)
y=fakedata(3*x+10) #y is a vector of fake data which will have a linear relationship with x
plot(x,y)
cor(x,y) #x and y are very highly correlated
y2=fakedata(3*x+10,1) #increasing the value of s decreases the correlation
plot(x,y2)
cor(x,y2) #x and y2 are not as highly correlated

##you can also, of course do non-linear relationships
y3=fakedata(sqrt(1/x))
plot(x,y3)



