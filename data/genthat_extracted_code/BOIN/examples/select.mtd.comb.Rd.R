library(BOIN)


### Name: select.mtd.comb
### Title: Select the maximum tolerated dose (MTD) or MTD contour for drug
###   combination trials
### Aliases: select.mtd.comb

### ** Examples


### drug-combination trial to find a single MTD

## Select the MTD based on the data from a 3x5 combination trial
## matrix n contains the number of patients treated at each dose combination
## matrix y contains the number of patients experienced toxicity at each dose combination
n <- matrix(c(3, 5, 0, 0, 0, 7, 6, 15, 0, 0, 0, 0, 4, 0, 0), ncol=5, byrow=TRUE)
y <- matrix(c(0, 1, 0, 0, 0, 1, 1, 4, 0, 0, 0, 0, 2, 0, 0), ncol=5, byrow=TRUE)
sel.comb <- select.mtd.comb(target=0.3, npts=n, ntox=y)
summary.boin(sel.comb)
plot.boin(sel.comb)


### drug-combination trial to find the MTD contour

## Select the MTD contour based on the data from a 3x4 combination trial
## matrix n contains the number of patients treated at each dose combination
## matrix y contains the number of patients experienced toxicity at each dose combination
n <- matrix(c(6, 9, 24, 0,  6, 24, 9, 0,  12, 18, 0, 0), ncol=4, byrow=TRUE)
y <- matrix(c(0, 1,  5, 0,  1,  5, 4, 0,  1, 5, 0, 0), ncol=4, byrow=TRUE)
sel.comb2 <- select.mtd.comb(target=0.3, npts=n, ntox=y, mtd.contour=TRUE)
summary.boin(sel.comb2)
plot.boin(sel.comb2)





