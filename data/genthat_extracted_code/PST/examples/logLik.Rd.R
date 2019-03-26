library(PST)


### Name: logLik
### Title: Log-Likelihood of a variable length Markov chain model
### Aliases: logLik logLik,PSTf-method
### Keywords: models

### ** Examples

## activity calendar for year 2000
## from the Swiss Household Panel
## see ?actcal
data(actcal)

## selecting individuals aged 20 to 59
actcal <- actcal[actcal$age00>=20 & actcal$age00 <60,]

## defining a sequence object
actcal.lab <- c("> 37 hours", "19-36 hours", "1-18 hours", "no work")
actcal.seq <- seqdef(actcal,13:24,labels=actcal.lab)

## building a PST
actcal.pst <- pstree(actcal.seq, nmin=2, ymin=0.001)
logLik(actcal.pst)

## Cut-offs for 5% and 1% (see ?prune)
C99 <- qchisq(0.99,4-1)/2

## pruning
actcal.pst.C99 <- prune(actcal.pst, gain="G2", C=C99)

## Comparing AIC
AIC(actcal.pst, actcal.pst.C99)



