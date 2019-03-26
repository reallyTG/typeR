library(easyanova)


### Name: ea1
### Title: Analysis of variance in simple designs
### Aliases: ea1

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

# analysis with a covariate
# Kaps and Lamberson (2009)
# data(data10)

# analysis in completely randomized design
# r6<-ea1(data10[-3], design=5)

# r6


# incomplete blocks type I and II
# Pimentel Gomes and Garcia (2002)
# data(data11)
# data(data12)

#r7<-ea1(data11,design=7)
#r8<-ea1(data12,design=7)

#r7;r8


# incomplete blocks type III or augmented blocks 
# Cruz and Carneiro (2006)
# data(data13)

#r9<-ea1(data13, design=8)
#r9



# incomplete blocks type III in animal experiments
# Sampaio (2010)
# data(data14)

# r10<-ea1(data14, design=9)
# r10

# lattice 
# Pimentel Gomes and Garcia (2002)
# data(data15)

#r11<-ea1(data15, design=10) # intra-block analysis 
#r12<-ea1(data15, design=11) # inter-block analysis

#r11
#r12

# switchback design
# Sampaio (2010)
# data(data16)
# r13<-ea1(data16, design=12)
# r13

# switchback design in blocks
# Sanders and Gaynor (1987)
# data(data17)
# r14<-ea1(data17, design=13)
# r14

#Kruskal-Wallis Rank Sum Test
r15<-ea1(data1, design=14)
r15

#Friedman Rank Sum Test
r16<-ea1(data2, design=15)
r16





