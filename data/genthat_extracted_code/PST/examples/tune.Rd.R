library(PST)


### Name: tune
### Title: AIC, AICc or BIC based model selection
### Aliases: tune tune,PSTf-method
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

## Cut-offs for 5% and 1% (see ?prune)
C95 <- qchisq(0.95,4-1)/2
C99 <- qchisq(0.99,4-1)/2

## selecting the optimal PST using AIC criterion
actcal.pst.opt <- tune(actcal.pst, gain="G2", C=c(C95,C99))

## plotting the tree
plot(actcal.pst.opt)



