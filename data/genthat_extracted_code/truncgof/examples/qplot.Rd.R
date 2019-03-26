library(truncgof)


### Name: qplot
### Title: QQ-Plot
### Aliases: qplot
### Keywords: aplot

### ** Examples

set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample

# for not assigned treshold the folliwing 
# graphics are identical but not usefull
par(mfrow = c(2,1))
y <- qlnorm(ppoints(length(xt)), 2, 2)
qplot(xt, "plnorm", list(2,2))
qqplot(xt, y); abline(0,1)

# fot trucated data rather use
qplot(xt, "plnorm", list(2,2), H = 10)




