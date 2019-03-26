library(PST)


### Name: pmine
### Title: PST based pattern mining
### Aliases: pmine pmine,PSTf,stslist-method
### Keywords: misc

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

## pruning
## Cut-offs for 5% and 1% (see ?prune)
C99 <- qchisq(0.99,4-1)/2
actcal.pst.C99 <- prune(actcal.pst, gain="G2", C=C99)

## example 1
pmine(actcal.pst.C99, actcal.seq, pmin=0.4, lag=2)

## example 2: patterns of length 6 having p>=0.6
pmine(actcal.pst.C99, actcal.seq, pmin=0.6, l=6)



