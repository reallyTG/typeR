library(agridat)


### Name: wiebe.wheat.uniformity
### Title: Uniformity trial of wheat
### Aliases: wiebe.wheat.uniformity
### Keywords: datasets

### ** Examples


data(wiebe.wheat.uniformity)
dat <- wiebe.wheat.uniformity

if(require(desplot)){
  desplot(yield~col+row, dat,
          aspect=125/180, flip=TRUE, # true aspect
          main="wiebe.wheat.uniformity: yield") # row 1 is at south
}


# Preece (1981) found the last digits have an interesting distribution
# with 0 and 5 much more common than other digits.
dig <- substring(dat$yield, nchar(dat$yield))
dig <- as.numeric(dig)
hist(dig, breaks=0:10-.5, xlab="Last digit",
     main="wiebe.wheat.uniformity - histogram of last digit")
table(dat$col, dig) # Table 3 of Preece

# Loess
# m3 <- loess(yield~row+col, dat)
# plot(dat$row, resid(m3), ylim=c(-300,300),
#      main="wiebe.wheat.uniformity")

# Wilkinson (1983, p. 152) noted that an 8-row planter was used which
# produced a recurring pattern of row effects on yield.  This can be seen
# in the high autocorrelations of row means at lag 8 and lag 16
rowm <- tapply(dat$yield, dat$row, mean)
acf(rowm, main="wiebe.wheat.uniformity row means")
# Plot the row mean against the planter row unit 1-8
require("lattice")
xyplot(rowm~rep(1:8, length=125),
       main="wiebe.wheat.uniformity",
       xlab="Planter row unit", ylab="Row mean yield")




