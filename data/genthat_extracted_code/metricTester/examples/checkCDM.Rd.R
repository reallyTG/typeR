library(metricTester)


### Name: checkCDM
### Title: Confirm that a CDM will run
### Aliases: checkCDM

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#this CDM should pass the check
checkCDM(cdm)

#this CDM should not pass the check
test <- matrix(nrow=3, ncol=10)
test[1,] <- 1:10
test[2,] <- c(1,1,0,0,0,0,0,0,0,0)
test[3,] <- c(1,1,0,0,0,0,0,0,0,0)
test <- as.data.frame(test)
names(test)<-paste("s",1:10, sep="")
row.names(test) <- c("cell1","cell2","cell3")
checkCDM(test)



