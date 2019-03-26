library(DLMtool)


### Name: Growth2OM
### Title: Generate bootstrapped estimates of von Bertalanffy growth
###   parameters from length-at-age data
### Aliases: Growth2OM

### ** Examples

# Simple model to generate length-at-age data
OM <- DLMtool::testOM 
OM@nsim <- 2
Hist <- runMSE(OM, Hist=TRUE)
N <- Hist$AtAge$N[1,,1] * Hist$AtAge$Sl_age[1,,1]
meanL <- Hist$AtAge$Len_age[1,,1]
sdL <- Hist$AtAge$Len_age[1,,1] * 0.1
nsamp <- ceiling(N/sum(N) * 1000)
Length <- unlist(sapply(1:length(meanL), function(i) rnorm(nsamp[i], meanL[i], sdL[i])))
Ages <- rep(1:length(N), nsamp)
data <- data.frame(Age=Ages, Length=Length)

# Return an OM with cpars populated
OM@nsim <- 48
newOM <- Growth2OM(data, OM)

# Return a data.frame
estPars <- Growth2OM(data)
 



