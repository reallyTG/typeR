library(PST)


### Name: subtree
### Title: Extract a subtree from a segmented PST
### Aliases: subtree subtree,PSTf-method
### Keywords: methods models

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

## building a PST segmented by age group
gage10 <- cut(actcal$age00, c(20,30,40,50,60), right=FALSE,
	labels=c("20-29","30-39", "40-49", "50-59"))

actcal.pstg <- pstree(actcal.seq, nmin=2, ymin=0.001, group=gage10)

## pruning
C99 <- qchisq(0.99,4-1)/2
actcal.pstg.opt <- prune(actcal.pstg, gain="G2", C=C99)

## extracting PST for age group 20-39 and 30-39
g1.pst <- subtree(actcal.pstg.opt, group=1)
g2.pst <- subtree(actcal.pstg.opt, group=2)

## plotting the two PST
par(mfrow=c(1,2))
plot(g1.pst, withlegend=FALSE, max.level=4, main="20-29")
plot(g2.pst, withlegend=FALSE, max.level=4, main="30-39")




