library(bioPN)


### Name: b) Simulation Functions
### Title: Simulation of a biochemical system
### Aliases: GillespieOptimDirect GillespieDirectGB GibsonBruck
###   GillespieDirectCR HaseltineRawlings RungeKuttaDormandPrince45
###   PartitionedLeaping
### Keywords: ~kwd1 ~kwd2

### ** Examples

## bioPN has been tested only on 64 bits machines.
## It may fail in 32 bits architecture.
if (.Machine$sizeof.pointer == 8) {

####### Reaction constants
H <- 10
K <- 6
r <- 0.25
c <- 3
b <- 2
#######

Gi <- 1
Ga <- 2
mRNA <- 3
Protein <- 4

model <- list(
    pre=matrix(c(1,0,0,0, 0,1,0,0, 0,1,0,0,
        0,0,1,0, 0,0,1,0, 0,0,0,1),
        ncol=4, byrow=TRUE),
    post=matrix(c(0,1,0,0, 1,0,0,0, 0,1,1,0,
        0,0,0,0, 0,0,1,1, 0,0,0,0),
        ncol=4, byrow=TRUE),
    h=list(c, b, H, 1, K, r),
    M=c(1,0,0,0))

timep <- 200
delta <- 1

##############################
## Completely Deterministic ##
##############################
Sim <- RungeKuttaDormandPrince45(model, timep, delta)

## Note, it could also be done as follows
## slow <- rep(0, transitions)
## Sim <- HaseltineRawlings(model, timep, delta, runs = 1)

mRNA.run <- Sim$run[[1]]$M[[mRNA]]
protein.run <- Sim$run[[1]]$M[[Protein]]

## Theoretical results (red lines in following plots)
Mean.mRNA <- c/(c+b)*H
Mean.protein <- Mean.mRNA * K/r

par(mfrow=c(1,2))
par(mar=c(2, 4, 2, 1) + 0.1)
plot(Sim$dt, mRNA.run,type="l", ylab="Mean",main="mRNA")
legend(x="bottom", paste("Deterministic run"))
abline(h=Mean.mRNA,col="red", lwd=1)
plot(Sim$dt, protein.run,type="l", ylab="Mean",main="Protein")
legend(x="bottom", paste("Deterministic run"))
abline(h=Mean.protein,col="red", lwd=1)


runs <- 100	## Increase to 10000 for better fit
###########################
## Completely Stochastic ##
###########################
set.seed(19761111)  ## Set a seed (for reproducible results)
Sim <- GillespieOptimDirect(model, timep, delta, runs)

## Note, it could also be done as follows
## slow <- rep(1, transitions)
## Sim <- HaseltineRawlings(model, timep, delta, runs)

mRNA.run <- sapply(Sim$run, function(run) {run$M[[mRNA]]})
protein.run <- sapply(Sim$run, function(run) {run$M[[Protein]]})

## Histograms of protein at different time points.
par(mfrow=c(2,2))
par(mar=c(2, 4, 2.5, 1) + 0.1)
hist(protein.run[Sim$dt == 1,], main="Protein Distribution at t=1sec")
hist(protein.run[Sim$dt == 2,], main="Protein Distribution at t=2sec")
hist(protein.run[Sim$dt == 10,], main="Protein Distribution at t=10sec")
hist(protein.run[Sim$dt == 200,], main="Protein Distribution at t=200sec")

## Theoretical results (red lines in following plots)
Mean.mRNA <- c/(c+b)*H
Var.mRNA <- b/(c*(1+c+b))*Mean.mRNA^2 + Mean.mRNA
Mean.protein <- Mean.mRNA * K/r
Var.protein <- r*b*(1+c+b+r)/(c*(1+r)*(1+c+b)*(r+c+b))*Mean.protein^2 +
  r/(1+r)*Mean.protein^2/Mean.mRNA + Mean.protein

if (runs > 1 ) {
  par(mfrow=c(2,2))
} else {
  par(mfrow=c(1,2))
}
par(mar=c(2, 4, 2, 1) + 0.1)
plot(Sim$dt, apply(mRNA.run,1,function(tpt) {mean(tpt)}),type="l", ylab="Mean",main="mRNA")
legend(x="bottom", paste("Gene, mRNA and Protein Stochastic\nRuns :", runs))
abline(h=Mean.mRNA,col="red", lwd=1)
plot(Sim$dt, apply(protein.run,1,function(tpt) {mean(tpt)}),type="l", ylab="Mean",main="Protein")
legend(x="bottom", paste("Gene, mRNA and Protein Stochastic\nRuns :", runs))
abline(h=Mean.protein,col="red", lwd=1)
if (runs > 1 ) {
  par(mar=c(2, 4, 0, 1) + 0.1)
  plot(Sim$dt, apply(mRNA.run,1,function(tpt) {var(tpt)}),type="l", ylab="Var")
  abline(h=Var.mRNA,col="red", lwd=1)
  plot(Sim$dt, apply(protein.run,1,function(tpt) {var(tpt)}),type="l", ylab="Var")
  abline(h=Var.protein,col="red", lwd=1)
}


######################################################################
## Hybrid: mRNA and protein fast, gene activation/inactivation slow ##
######################################################################
model$slow <- c(1,1,0,0,0,0)

Sim <- HaseltineRawlings(model, timep, delta, runs)

mRNA.run <- sapply(Sim$run, function(run) {run$M[[mRNA]]})
protein.run <- sapply(Sim$run, function(run) {run$M[[Protein]]})
    
Mean.mRNA <- c/(c+b)*H
Var.mRNA <- b/(c*(1+c+b))*Mean.mRNA^2
Mean.protein <- Mean.mRNA * K/r
Var.protein <- r*b*(1+c+b+r)/(c*(1+r)*(1+c+b)*(r+c+b))*Mean.protein^2

if (runs > 1 ) {
  par(mfrow=c(2,2))
} else {
  par(mfrow=c(1,2))
}
par(mar=c(2, 4, 2, 1) + 0.1)
plot(Sim$dt, apply(mRNA.run,1,function(tpt) {mean(tpt)}),type="l", ylab="Mean",main="mRNA")
legend(x="bottom", paste("Only Gene Stochastic\nRuns :", runs))
abline(h=Mean.mRNA,col="red", lwd=1)
plot(Sim$dt, apply(protein.run,1,function(tpt) {mean(tpt)}),type="l", ylab="Mean",main="Protein")
legend(x="bottom", paste("Only Gene Stochastic\nRuns :", runs))
abline(h=Mean.protein,col="red", lwd=1)
if (runs > 1 ) {
  par(mar=c(2, 4, 0, 1) + 0.1)
  plot(Sim$dt, apply(mRNA.run,1,function(tpt) {var(tpt)}),type="l", ylab="Var")
  abline(h=Var.mRNA,col="red", lwd=1)
  plot(Sim$dt, apply(protein.run,1,function(tpt) {var(tpt)}),type="l", ylab="Var")
  abline(h=Var.protein,col="red", lwd=1)
}
}



