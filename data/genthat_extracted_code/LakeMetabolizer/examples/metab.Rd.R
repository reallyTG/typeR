library(LakeMetabolizer)


### Name: metab
### Title: Calculate metabolism
### Aliases: metab
### Keywords: metabolism

### ** Examples


# fake data
datetime <- seq(as.POSIXct("2014-06-16 00:00:00", tz="GMT"), 
     as.POSIXct("2014-06-17 23:55:00", tz="GMT"), length.out=288*2)
do.obs <- 2*sin(2*pi*(1/288)*(1:(288*2))+1.1*pi) + 8 + rnorm(288*2, 0, 0.5)
wtr <- 3*sin(2*pi*(1/288)*(1:(288*2))+pi) + 17 + rnorm(288*2, 0, 0.15)
do.sat <- LakeMetabolizer:::o2.at.sat.base(wtr, 960)
irr <- (1500*sin(2*pi*(1/288)*(1:(288*2))+1.5*pi) +650 + rnorm(288*2, 0, 0.25)) * 
     ifelse(is.day(datetime, 42.3), 1, 0)
k.gas <- 0.4
z.mix <- 1

# plot time series
plot(wtr, type="l", xaxt="n", yaxt="n", xlab="", ylab="")
par(new=TRUE); plot(do.obs, type="l", col="blue", xaxt="n", yaxt="n", xlab="", ylab="")
par(new=TRUE); plot(irr, type="l", col="orange", xaxt="n", yaxt="n", xlab="", ylab="")
abline(v=144, lty="dotted")
abline(v=288)
legend("topleft", legend=c("wtr", "do.obs", "irr"), lty=1, 
     col=c("black", "blue", "orange"), inset=c(0.08, 0.01))

# put data in a data.frame
data <- data.frame(datetime=datetime, do.obs=do.obs, do.sat=do.sat, k.gas=k.gas, 
     z.mix=z.mix, irr=irr, wtr=wtr)

# run each metabolism model
m.bk <- metab(data, "bookkeep", lake.lat=42.6)
 m.bk <- metab(data, lake.lat=42.6) # no method defaults to "bookeep" 
m.ols <- metab(data, "ols", lake.lat=42.6)
m.mle <- metab(data, "mle", lake.lat=42.6)
m.kal <- metab(data, "kalman", lake.lat=42.6)
## Not run: m.bay <- metab(data, "bayesian", lake.lat=42.6)

# example attributes
names(attributes(m.ols))
attr(m.ols, "mod")
 
# To get full JAGS model
# including posterior draws:
## Not run: names(attributes(m.bay))
## Not run: attr(m.bay, "model")




