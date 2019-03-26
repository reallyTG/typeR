library(ptest)


### Name: ptestReg
### Title: Test short time series for periodicity with maximum likelihood
###   ratio tests
### Aliases: ptestReg
### Keywords: ts

### ** Examples

# Simulate the harmonic regression model with standard Gaussian error terms
set.seed(193)
# Non-Fourier frequency
z <- simHReg(n = 14, f=2/10, A = 2, B = 1, model="Gaussian",sig=1) 
ptestReg(z,method = "LS") #Normal likelihood ratio test
ptestReg(z,method = "L1") #Laplace likelihood ratio test  
fitHReg(z, algorithm="exact") #the nls fitted result 
    
                                           
# Performe tests on the alpha factor experiment
data(alpha)
## Eliminate genes with missing observations
alpha.nonNA <- alpha[complete.cases(alpha),]
## Using the multiple option to do the test for all the genes
## Transpose the data set so that each column stands for a gene
alpha.nonNA <- t(alpha.nonNA)
result <- ptestReg(alpha.nonNA, method = "LS",multiple=TRUE) 
str(result)       


# The movtivating example: gene ORF06806 in Cc
data(Cc)
x <- Cc[which(rownames(Cc)=="ORF06806"),]
plot(1:length(x),x,type="b", main="ORF06806",
     xlab="time",ylab="Gene expression")
ptestg(x,method="Fisher") #Fail to detect the periodicity
ptestReg(x,method="LS") #The periodicity is significantly not zero
ptestReg(x,method="L1") #The periodicity is significantly not zero




