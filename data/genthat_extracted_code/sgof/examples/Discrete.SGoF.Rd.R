library(sgof)


### Name: Discrete.SGoF
### Title: Discrete SGoF multiple testing procedure
### Aliases: Discrete.SGoF print.Discrete.SGoF
### Keywords: htest Binomial.SGoF multi-testing

### ** Examples



require(discreteMTP)

data(amnesia) #discrete data

A11 <- amnesia$AmnesiaCases 
A21 <- sum(amnesia$AllAdverseCases) - A11
A12 <- amnesia$AllAdverseCases - A11
A22 <- sum(amnesia$AllAdverseCases) - sum(amnesia$AmnesiaCases) - A12

A1. <- sum(amnesia$AmnesiaCases)
A2. <- sum(amnesia$AllAdverseCases) - A1.   
n <- A11 + A12
k <- pmin(n,A1.)

pCDFlist <- list()
pvec <- numeric(nrow(amnesia))

## Calculation of the p-values and the p-values CDFs: 

for (i in 1:nrow(amnesia))
{
  x <- 0:k[i]
  pCDFlist[[i]] <- dhyper(x ,A1., A2. ,n[i]) + phyper(x ,A1. ,A2. ,n[i] ,lower.tail = FALSE)
  pCDFlist[[i]] <- rev(pCDFlist[[i]])
  pvec[i] <- dhyper(A11[i] ,A1. ,A2. ,n[i]) + phyper(A11[i] ,A1. ,A2. ,n[i] ,lower.tail = FALSE)
}

res<-Discrete.SGoF(u=pvec,pCDFlist=pCDFlist,alpha=0.05,gamma=0.05,Discrete=TRUE,Sides=1)
res


#continuous p-values

res2<-Discrete.SGoF(u=Hedenfalk$x,K=3170,Discrete=FALSE, method="DFT-CF",Sides=2)
res2




