library(rforensicbatwing)


### Name: Inference from STR data using coalescent theory
### Title: Inference from STR data using coalescent theory (e.g.
###   calculating forensic trace-suspect match probability)
### Aliases: batwing coalmatchprob print.batwing plot.forensicbatwing
### Keywords: coalescent coalescence

### ** Examples

## Not run: 
##D database <- matrix(c(1, 1, 2, 2, 1, 3), 3, 2)
##D haplotype <- c(1, 1)
##D 
##D # coalmatchprob:
##D coalmp <- coalmatchprob(database, haplotype, 
##D  reps = 1000, burnin = 0, treebetN = 10, Nbetsamp = 10, 
##D  muprior = c("normal(0.003, 0.001)",  "normal(0.005, 0.001)"), 
##D  Nprior = "lognormal(9, 1)", 
##D  alphaprior = NULL, 
##D  progress = TRUE, trace = FALSE)
##D coalmp
##D 
##D murange <- range(c(coalmp$result$mu1, coalmp$result$mu2))
##D 
##D par(mfrow = c(2, 2))
##D plot(coalmp)
##D plot(coalmp$result$N, type = "l", ylab = "N")
##D 
##D plot(coalmp$result$mu1, type = "l", col = "red", ylim = murange, ylab = "mu")
##D points(coalmp$result$mu2, type = "l", col = "blue")
##D 
##D hist(coalmp$result$mu1, col = "#FF000066", 
##D   xlim = murange, ylim = c(0, 250), main = NULL, xlab = "mu")
##D hist(coalmp$result$mu2, add = TRUE, col = "#0000FF66")
##D par(mfrow = c(1, 1))
##D 
##D # batwing:
##D bw <- batwing(database, 
##D  reps = 10000, burnin = 1000, treebetN = 10, Nbetsamp = 10, 
##D  muprior = "normal(0.003, 0.001)", 
##D  Nprior = "lognormal(9, 1)", 
##D  alphaprior = NULL, 
##D  progress = TRUE, trace = FALSE)
##D bw
## End(Not run)



