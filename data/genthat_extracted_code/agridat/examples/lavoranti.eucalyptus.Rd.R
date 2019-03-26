library(agridat)


### Name: lavoranti.eucalyptus
### Title: Height of Eucalyptus trees in southern Brazil
### Aliases: lavoranti.eucalyptus
### Keywords: datasets

### ** Examples


# Arciniegas-Alarcon et al use SVD and regression to estimate missing values.
# Partition the matrix X as a missing value xm, row vector xr1, column
# vector xc1, and submatrix X11
# X = [ xm  xr1 ]
#     [ xc1 X11 ] and let X11 = UDV'.
# Estimate the missing value xm = xr1 V D^{-1} U' xc1

data(lavoranti.eucalyptus)
dat <- lavoranti.eucalyptus

require(lattice)
levelplot(height~loc*gen, dat, main="lavoranti.eucalyptus - GxE heatmap")

dat <- droplevels(subset(dat, origin=="Ravenshoe"))
if(require(reshape2)){
dat <- acast(dat, gen~loc, value.var='height')

dat[1,1] <- NA
x11 <- dat[-1,][,-1]
X11.svd <- svd(x11)
xc1 <- dat[-1,][,1]
xr1 <- dat[,-1][1,]
xm <- xr1 
xm # = 18.29, Original value was 17.4
}




