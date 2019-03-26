library(outbreaker)


### Name: simOutbreak
### Title: Simulation of pathogen genotypes during disease outbreaks
### Aliases: simOutbreak print.simOutbreak [.simOutbreak labels.simOutbreak
###   simOutbreak-class as.igraph.simOutbreak plot.simOutbreak disperse
###   print.simOutbreak [.simOutbreak labels.simOutbreak
###   as.igraph.simOutbreak plot.simOutbreak

### ** Examples


## Not run: 
##D dat <- list(n=0)
##D 
##D ## simulate data with at least 30 cases
##D while(dat$n < 30){
##D    dat <- simOutbreak(R0 = 2, infec.curve = c(0, 1, 1, 1), n.hosts = 100)
##D }
##D dat
##D 
##D ## plot first 30 cases
##D N <- dat$n
##D plot(dat[1:(min(N,30))], main="First 30 cases")
##D mtext(side=3, text="nb mutations / nb generations")
##D 
##D ## plot a random subset (n=10) of the first cases
##D x <- dat[sample(1:min(N,30), 10, replace=FALSE)]
##D plot(x, main="Random sample of 10 of the first 30 cases")
##D mtext(side=3, text="nb mutations / nb generations")
##D 
##D ## plot population dynamics
##D head(dat$dynam,15)
##D matplot(dat$dynam[1:max(dat$onset),],xlab="time",
##D    ylab="nb of individuals", pch=c("S","I","R"), type="b")
##D 
##D 
##D ## spatial model
##D w <-  exp(-sqrt((1:40)))
##D x <- simOutbreak(2, w, spatial=TRUE,
##D                  duration=500, disp=0.1, reach=.2)
##D 
##D ## spatial model, no dispersal
##D x <- simOutbreak(.5, w, spatial=TRUE,
##D                  duration=500, disp=0, reach=5)
## End(Not run)




