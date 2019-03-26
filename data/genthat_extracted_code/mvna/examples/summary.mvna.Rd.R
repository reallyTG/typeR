library(mvna)


### Name: summary.mvna
### Title: Summary method for objects of class 'mvna'
### Aliases: summary.mvna print.summary.mvna
### Keywords: survival

### ** Examples

data(sir.adm)

## data set transformation
data(sir.adm) 
id <- sir.adm$id
from <- sir.adm$pneu
to <- ifelse(sir.adm$status==0,"cens",sir.adm$status+1)
times <- sir.adm$time
dat.sir <- data.frame(id,from,to,time=times)

## Possible transitions
tra <- matrix(ncol=4,nrow=4,FALSE)
tra[1:2,3:4] <- TRUE

na.pneu <- mvna(dat.sir,c("0","1","2","3"),
                tra,"cens")

summ.na.pneu <- summary(na.pneu)

## cumulative hazard for 0 -> 2 transition:
summ.na.pneu$"0 2"$na



