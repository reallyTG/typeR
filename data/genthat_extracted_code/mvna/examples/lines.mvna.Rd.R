library(mvna)


### Name: lines.mvna
### Title: Lines method for 'mvna' objects
### Aliases: lines.mvna
### Keywords: aplot survival

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

plot(na.pneu, tr.choice = c("0 2"), conf.int = TRUE,
     col = 1, lty = 1, legend = FALSE)

lines(na.pneu, tr.choice = c("1 2"), conf.int = TRUE,
      col = 2, lty = 1)



