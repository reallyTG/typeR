library(ptest)


### Name: ptestg
### Title: Test short time series for periodicity based on periodograms
### Aliases: ptestg
### Keywords: ts

### ** Examples

# Simulate the harmonic regression model with standard Gaussian error terms
set.seed(193)
## Non-Fourier frequency
z <- simHReg(n = 14, f=2/10, A = 2, B = 1, model="Gaussian",sig=1) 
ptestg(z,method="Fisher")
ptestg(z,method="robust")
ptestg(z,method="extended")
ptestg(z,method="extendedRobust")
ptestg(z,method="FisherRSR")

# Performe tests on the alpha factor experiment
data(alpha)
## Eliminate genes with missing observations
alpha.nonNA <- alpha[complete.cases(alpha),]
## Using the multiple option to do the test for all the genes
## Transpose the data set so that each column stands for a gene
alpha.nonNA <- t(alpha.nonNA)
result <- ptestg(alpha.nonNA, method = "extended",multiple=TRUE) 
str(result)              

                                                                        
# The movtivating example: gene ORF06806 in Cc
data(Cc)
x <- Cc[which(rownames(Cc)=="ORF06806"),]
plot(1:length(x),x,type="b", main="ORF06806",
     xlab="time",ylab="Gene expression")
ptestg(x,method="Fisher") #Fail to detect the periodicity
ptestg(x,method="robust") 
ptestg(x,method="extended") 




