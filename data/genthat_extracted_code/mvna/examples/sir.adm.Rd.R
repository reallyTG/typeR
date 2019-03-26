library(mvna)


### Name: sir.adm
### Title: Pneumonia on admission in intenive care unit patients
### Aliases: sir.adm
### Keywords: datasets survival

### ** Examples

# data set transformation
data(sir.adm) 
id <- sir.adm$id
from <- sir.adm$pneu
to <- ifelse(sir.adm$status==0,"cens",sir.adm$status+1)
times <- sir.adm$time
dat.sir <- data.frame(id,from,to,time=times)

# Possible transitions
tra <- matrix(ncol=4,nrow=4,FALSE)
tra[1:2,3:4] <- TRUE

na.pneu <- mvna(dat.sir,c("0","1","2","3"),
                tra,"cens")

if(require("lattice")) {
xyplot(na.pneu,tr.choice=c("0 2","1 2","0 3","1 3"),
       aspect=1,strip=strip.custom(bg="white",
       factor.levels=c("No pneumonia on admission -- Discharge",
                       "Pneumonia on admission -- Discharge",
                       "No pneumonia on admission -- Death",
                       "Pneumonia on admission -- Death"),
       par.strip.text=list(cex=0.9)),
       scales=list(alternating=1),xlab="Days",
       ylab="Nelson-Aalen esimates")
}



