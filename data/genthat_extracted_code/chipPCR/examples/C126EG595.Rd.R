library(chipPCR)


### Name: C126EG595
### Title: qPCR Experiment for the Amplification of HPRT1 Using the Bio-Rad
###   iQ5 thermo cycler
### Aliases: C126EG595
### Keywords: hydrolysis EvaGreen HPRT1

### ** Examples

data(C126EG595)
tmp  <- C126EG595

plot(NA,NA, xlim = c(1,40), ylim = c(min(tmp[, 2:ncol(tmp)]), 
   max(tmp[, 2:ncol(tmp)])), xlab = "Cycle", ylab = "RFU (FAM)", 
   main = "Amplification monitored at \n58.5 degrees Celsius (annealing step)")
apply(tmp[, 2:ncol(tmp)], 2, 
      function(x) lines(tmp[1:nrow(tmp),1],x))



