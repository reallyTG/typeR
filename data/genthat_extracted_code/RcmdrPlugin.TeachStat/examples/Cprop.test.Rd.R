library(RcmdrPlugin.TeachStat)


### Name: Cprop.test
### Title: Test for proportions of one or two samples
### Aliases: Cprop.test

### ** Examples

## Proportion for a sample
Cprop.test(1,6) # 1 success in 6 attempts

#### With a data set: proportion of cars not manufactured in US
data(cars93) #data set provided with the package
exitos<-sum(cars93$USA == "nonUS")
total<-length(cars93$USA)
Cprop.test(ex=exitos, nx=total)

## Difference of proportions
Cprop.test(1,6,3,15)
  # Sample 1: 1 success in 6 attempts
  # Sample 2: 3 success in 15 attempts

#### With a data set: difference of proportions of cars not manufactured in US 
#### between manual and automatic
exitosx<-sum(cars93$USA == "nonUS" & cars93$Manual == "Yes" )
totalx<-sum(cars93$Manual == "Yes")
exitosy<-sum(cars93$USA == "nonUS" & cars93$Manual == "No" )
totaly<-sum(cars93$Manual == "No")
Cprop.test(ex=exitosx, nx=totalx,ey=exitosy, ny=totaly)



