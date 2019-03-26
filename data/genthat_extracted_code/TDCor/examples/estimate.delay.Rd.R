library(TDCor)


### Name: estimate.delay
### Title: Estimate the time shift between two gene profiles and make a
###   plot
### Aliases: estimate.delay
### Keywords: Side functions

### ** Examples

# Load the data

data(LR_dataset)
data(l_genes)
data(l_names)
data(times)

# Estimate the time shift between LBD16 and PUCHI (one time shift estimate returned)

estimate.delay(dataset=LR_dataset, tar=l_genes[which(l_names=="PUCHI")], 
reg=l_genes[which(l_names=="LBD16")], times=times, time_step=1, thr_cor=0.7, 
tol=0.15, delaymax=3, delayspan=12, reg.name="LBD16",tar.name="PUCHI")

# Estimate the time shift between ARF8 and PLT1 (two time shift estimates returned)

estimate.delay(dataset=LR_dataset, tar=l_genes[which(l_names=="PLT1")], 
reg=l_genes[which(l_names=="ARF8")], times=times, time_step=1, thr_cor=0.7, 
tol=0.15, delaymax=3, delayspan=12, reg.name="ARF8",tar.name="PLT1")





