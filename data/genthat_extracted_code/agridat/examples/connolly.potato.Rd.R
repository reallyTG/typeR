library(agridat)


### Name: connolly.potato
### Title: Potato yields in single-drill plots
### Aliases: connolly.potato
### Keywords: datasets

### ** Examples


data(connolly.potato)
dat <- connolly.potato

# Field plan
if(require(desplot)){
  desplot(yield~col*row, data=dat,
          out1=rep, # aspect unknown
          main="connolly.potato yields (reps not contiguous)")
}


# Later maturities are higher yielding
require(lattice)
bwplot(yield~matur, dat, main="connolly.potato yield by maturity")

# Observed raw means. Matches Connolly table 2.
mn <- aggregate(yield~gen, data=dat, FUN=mean)
mn[rev(order(mn$yield)),]

# Create a covariate which is the average of neighboring plot yields
if(require(reshape2)){
mat <- acast(dat, row~col, value.var='yield')
mat2 <- matrix(NA, nrow=4, ncol=20)
mat2[,2:19] <- (mat[ , 1:18] + mat[ , 3:20])/2
mat2[ , 1] <- (mat[ , 1] + apply(mat, 1, mean))/2
mat2[ , 20] <- (mat[ , 20] + apply(mat, 1, mean))/2
dat2 <- melt(mat2)
colnames(dat2) <- c('row','col','cov')
dat <- merge(dat, dat2)
# xyplot(yield ~ cov, data=dat, type=c('p','r'))

# Connolly et al fit a model with avg neighbor yield as a covariate
m1 <- lm(yield ~ 0 + gen + rep + cov, data=dat)
coef(m1)['cov'] # = -.303  (Connolly obtained -.31)

# Block names and effects
bnm <- c("R1","R2","R3","R4")
beff <- c(0, coef(m1)[c('repR2','repR3','repR4')])
# Variety names and effects
vnm <- paste0("V", formatC(1:20, width=2, flag='0'))
veff <- coef(m1)[1:20]

# Adjust yield for variety and block effects
dat <- transform(dat, yadj = yield - beff[match(rep,bnm)]
                - veff[match(gen,vnm)])

# Similar to Connolly Fig 1.  Point pattern doesn't quite match
xyplot(yadj~cov, data=dat, type=c('p','r'),
       main="connolly.potato",
       xlab="Avg yield of nearest neighbors",
       ylab="Yield, adjusted for variety and block effects")
}





