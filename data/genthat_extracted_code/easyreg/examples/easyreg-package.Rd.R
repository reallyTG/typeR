library(easyreg)


### Name: easyreg-package
### Title: Easy Regression
### Aliases: easyreg-package easyreg

### ** Examples

# analysis in completely randomized design
data(data1)
r1=er2(data1)
names(r1)
r1
r1[1]

# analysis in randomized block design
data(data2)
r2=er2(data2, design=2)
r2

# analysis in latin square design
data(data3)
r3=er2(data3, design=3)
r3

# analysis in several latin squares
data(data4)
r4=er2(data4, design=4)
r4

# the growth of Zagorje turkeys (Kaps and Lamberson, 2009)

weight=c(44,66,100,150,265,370,455,605,770)
age=c(1,7,14,21,28,35,42,49,56)

data2=data.frame(age,weight)

# two linear
regplot(data2, model=5, start=c(25,6,10,20))

regplot(data2, model=5, start=c(25,6,10,20), digits=2)

# in other function
bl(data2)





