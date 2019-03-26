library(TraMineRextras)


### Name: plot.stslist.surv
### Title: Plot method for objects produced by the seqsurv function
### Aliases: plot.stslist.surv
### Keywords: Plot

### ** Examples

## Defining a sequence object with the data in columns 10 to 25
## (family status from age 15 to 30) in the biofam data set
data(biofam)
biofam.lab <- c("Parent", "Left", "Married", "Left+Marr",
"Child", "Left+Child", "Left+Marr+Child", "Divorced")
biofam.seq <- seqdef(biofam, 10:25, labels=biofam.lab)

## State survival plot
biofam.surv <- seqsurv(biofam.seq)
plot(biofam.surv)



