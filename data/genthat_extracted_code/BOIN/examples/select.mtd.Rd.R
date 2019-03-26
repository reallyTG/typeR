library(BOIN)


### Name: select.mtd
### Title: Select the maximum tolerated dose (MTD) for single agent trials
### Aliases: select.mtd

### ** Examples


### select the MTD for BOIN single agent trial
n <- c(3, 3, 15, 9, 0)
y <- c(0, 0, 4, 4, 0)
selmtd <- select.mtd(target=0.3, npts=n, ntox=y)
summary.boin(selmtd)
plot.boin(selmtd)





