library(easyreg)


### Name: bl
### Title: Analysis of broken line regression
### Aliases: bl

### ** Examples


# the growth of Zagorje turkeys (Kaps and Lamberson, 2009)

weight=c(44,66,100,150,265,370,455,605)
age=c(1,7,14,21,28,35,42,49)

data2=data.frame(age,weight)

# two linear
regplot(data2, model=5, start=c(25,6,10,20))

bl(data2, digits=2)


#linear and quadratic plateau
x=c(0,1,2,3,4,5,6)
y=c(1,2,3,6.1,5.9,6,6.1)

data=data.frame(x,y)

bl(data,model=2, lty=1, col=1, digits=2, position=8)


# effect os blocks
x=c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8)
y=c(4,12,9,20,16,25,21,31,28,42,33,46,33,46,34,44)
blocks=rep(c(1,2),8)

dat=data.frame(x,blocks,y)

bl(dat, 4)

bl(dat,5, sd=TRUE)

bl(dat,6, mean=FALSE)





