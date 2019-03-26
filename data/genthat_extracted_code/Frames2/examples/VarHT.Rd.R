library(Frames2)


### Name: VarHT
### Title: Variance estimator of Horvitz - Thompson estimator
### Aliases: VarHT

### ** Examples

##########   Example 1   ##########
U <- c(13, 18, 20, 14, 9)
#A simple random sample of size 2 without replacement is drawn from population
s <- sample(U, 2)
#Horvitz - Thompson estimator of population total is calculated.
ps <- c(0.4, 0.4)
HT(s, ps)
#Now, we calculate variance estimator of the Horvitz - Thompson estimator.
Ps <- matrix(c(0.4,0.1, 0.1,0.4), 2 ,2)
VarHT(s, Ps)

##########   Example 2   ##########
data(DatA)
attach(DatA)
data(PiklA)

#Let calculate Horvitz - Thompson estimator for total of variable Clothing in Frame A.
HT(Clo, ProbA)
#And now, let compute the variance of the previous estimator
VarHT(Clo, PiklA)




