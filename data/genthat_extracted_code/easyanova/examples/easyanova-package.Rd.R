library(easyanova)


### Name: easyanova-package
### Title: Analysis of Variance and Other Important Complementary Analyzes
### Aliases: easyanova-package easyanova

### ** Examples


# Kaps and Lamberson(2009)
data(data1)
data(data2)
data(data3)
data(data4)

# analysis in completely randomized design
r1<-ea1(data1, design=1)

names(r1)

r1

# analysis in randomized block design
r2<-ea1(data2, design=2)

# analysis in latin square design
r3<-ea1(data3, design=3)

# analysis in several latin squares design
r4<-ea1(data4, design=4)

r1[1]
r2[1]
r3[1]
r4[1]

# analysis in unbalanced randomized block design
response<-ifelse(data2$Gain>850, NA, data2$Gain)
ndata<-data.frame(data2[-3],response)
ndata

r5<-ea1(ndata, design=2 )

r5

# multivariable response (list argument = TRUE)
t<-c('a','a','a','b','b','b','c','c','c')
r1<-c(10,12,12.8,4,6,8,14,15,16)
r2<-c(102,105,106,125,123,124,99,95,96)
r3<-c(560,589,590,658,678,629,369,389,378)


d<-data.frame(t,r1,r2,r3)

results=ea1(d, design=1, list=TRUE)
names(results)
results

results[1][[1]]

names(results[1][[1]])




