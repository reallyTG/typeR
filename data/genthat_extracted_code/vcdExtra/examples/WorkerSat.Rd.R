library(vcdExtra)


### Name: WorkerSat
### Title: Worker Satisfaction Data
### Aliases: WorkerSat
### Keywords: datasets

### ** Examples

data(WorkerSat)

worker.tab <- xtabs(Freq ~ Worker + Super + Manage, data=WorkerSat)
fourfold(worker.tab)
mosaic(worker.tab, shade=TRUE)




