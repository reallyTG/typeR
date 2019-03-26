library(easyreg)


### Name: er2
### Title: Analysis of polynomial regression
### Aliases: er2

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

# data
treatments=rep(c(0.5,1,1.5,2,2.5,3), c(3,3,3,3,3,3))
r1=rnorm(18,60,3)
r2=r1*1:18
r3=r1*18:1
r4=r1*c(c(1:10),10,10,10,10,10,10,10,10)
data6=data.frame(treatments,r1,r2,r3, r4)

# use the argument list = TRUE
er2(data6, design=1, list=TRUE)




