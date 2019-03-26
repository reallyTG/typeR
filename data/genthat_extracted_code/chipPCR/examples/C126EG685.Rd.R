library(chipPCR)


### Name: C126EG685
### Title: qPCR Experiment for the Amplification of HPRT1 Using the Roche
###   Light Cycler 1.5
### Aliases: C126EG685
### Keywords: hydrolysis EvaGreen HPRT1

### ** Examples

data(C126EG685)
tmp <- C126EG685

plot(NA,NA, xlim = c(1,40), ylim = c(min(tmp[, 2:ncol(tmp)]), 
    max(tmp[, 2:ncol(tmp)])), xlab = "Cycle", 
    ylab = "RFU (FAM)", 
    main = "Amplification monitored at \n68.5 degrees Celsius (elongation 
step)")

apply(tmp[, 2:ncol(tmp)], 2, 
      function(x) lines(tmp[1:nrow(tmp),1],x))
      



