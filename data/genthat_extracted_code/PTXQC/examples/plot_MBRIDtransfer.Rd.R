library(PTXQC)


### Name: plot_MBRIDtransfer
### Title: Plot MaxQuant Match-between-runs id transfer performance.
### Aliases: plot_MBRIDtransfer

### ** Examples

 data = data.frame(fc.raw.file = rep(c("file A", "file B"), each = 3),
                   single = c(0.9853628, 0.8323160, 0.9438375,
                              0.9825538, 0.8003763, 0.9329961), 
                   multi.inRT = c(0.002927445, 0.055101018, 0.017593087,
                                  0.005636457, 0.099640044, 0.031870056),
                   multi.outRT = c(0.01170978, 0.11258294, 0.03856946,
                                   0.01180972, 0.09998363, 0.03513386),
                   sample = rep(c("genuine", "transferred", "all"), 2))
 plot_MBRIDtransfer(data)




