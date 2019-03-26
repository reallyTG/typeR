library(PopGenReport)


### Name: run.popgensim
### Title: Run a time-forward popgen simulation
### Aliases: run.popgensim

### ** Examples

## No test: 
library(raster)
set.seed(1)
locs <- cbind(x=round(runif(5,5,45)), y=round(runif(5,5,45)) )
cm <- as.matrix(dist(locs))
pops <- init.popgensim(n.pops = 5, n.ind=20, sex.ratio = 0.25, n.loci = 5, n.allels = 10, n.cov = 3)
#run pops
pops <- run.popgensim(pops, steps = 200, cost.mat= cm, n.offspring = 2, n.ind = 20,
mig.rate = 0.125, disp.max = 30, disp.rate =0.1, n.allels = 10, mut.rate = 0)
#convert to genind object
pops.gi <-pops2genind(pops)
#calculate pairwise fsts using pairwise.fstb
fsts <- pairwise.fstb(pops.gi)
#plot
plot(locs, xlim=c(0,50), ylim=c(0,50), pch=16,cex=4, col="darkgrey")
for (i in 1:4)
for (ii in (i+1):5)
lines(c(locs[i,1], locs[ii,1]), c(locs[i,2], locs[ii,2]), lwd=fsts[i,ii]*30, col="darkgreen")
text(locs+0.5, labels=1:5, col="white", font=2)
## End(No test)



