library(discreteMTP)


### Name: p.discrete.adjust
### Title: Adjusted Discrete Distributed P-values for Multiple Testing
### Aliases: p.discrete.adjust p.discrete.adjust.methods

### ** Examples

data(amnesia)

A11 <- amnesia$AmnesiaCases 
A21 <- sum(amnesia$AllAdverseCases) - A11
A12 <- amnesia$AllAdverseCases - A11
A22 <- sum(amnesia$AllAdverseCases) - sum(amnesia$AmnesiaCases) - A12

## Entry j in each of the four vectors is the data for the test of no association
## between drug j and amnesia :  
##                        Drug j    Other Drugs
##  Amnesia               A11[j]    A12[j]      A1.[j]      
##  Other Adverse events  A21[j]    A22[j]      A2.[j]
##                        n         N-n         N		

## For example, the 2X2 contingency table to test the hypothesis of
## amensia adverse drug reaction in the drug "ZOPICLONE":
matrix(c(A11[2444], A21[2444], A12[2444], A22[2444]),nrow = 2)

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

pBH <- p.discrete.adjust(pvec, pCDFlist, method = "BH")
pBL <- p.discrete.adjust(pvec, pCDFlist, method = "BL")
pBHmidp <- p.discrete.adjust(pvec, pCDFlist, method = "BHmidp")
pBLmidp <- p.discrete.adjust(pvec, pCDFlist, method = "BLmidp")
pDBH <- p.discrete.adjust(pvec, pCDFlist, method = "DBH")
pDBL <- p.discrete.adjust(pvec, pCDFlist, method = "DBL")

## Number of rejected hypothesis at level 0.05:
q <- 0.05
sum(pBL <= q)     ## 16  
sum(pBLmidp <= q) ## 17
sum(pDBL <= q)    ## 21
sum(pBH <= q)     ## 24
sum(pBHmidp <= q) ## 25
sum(pDBH <= q)    ## 27

## plotting:
o = order(pvec)

matplot(1:length(pvec), cbind(pvec[o], pBL[o], pBLmidp[o], pDBL[o], pBH[o], pBHmidp[o], pDBH[o]),
        type = "l", lty = c(4,3,3,3,2,2,2), 
        col = c("#4735B2","#B25A00","#24B200","#106B99","#B25A00","#24B200","#106B99"),
        xlim = c(1,100), xlab = "Rank", ylab = "Adjusted p-values")
abline(0.05,0,col = "grey")
legend("bottomright",legend=c("pvec-unadjusted","pBL","pBLmidp","pDBL","pBH","pBHmidp","pDBH"),
       lty = c(4,3,3,3,2,2,2),
       col = c("#4735B2","#B25A00","#24B200","#106B99","#B25A00","#24B200","#106B99"))



