library(VGAM)


### Name: loglinb2
### Title: Loglinear Model for Two Binary Responses
### Aliases: loglinb2
### Keywords: models regression

### ** Examples

coalminers <- transform(coalminers, Age = (age - 42) / 5)
# Get the n x 4 matrix of counts
fit0 <- vglm(cbind(nBnW,nBW,BnW,BW) ~ Age, binom2.or, data = coalminers)
counts <- round(c(weights(fit0, type = "prior")) * depvar(fit0))
# Create a n x 2 matrix response for loglinb2()
# bwmat <- matrix(c(0,0, 0,1, 1,0, 1,1), 4, 2, byrow = TRUE)
bwmat <- cbind(bln = c(0,0,1,1), wheeze = c(0,1,0,1))
matof1 <- matrix(1, nrow(counts), 1)
newminers <- data.frame(bln    = kronecker(matof1, bwmat[, 1]),
                        wheeze = kronecker(matof1, bwmat[, 2]),
                        wt     = c(t(counts)),
                        Age    = with(coalminers, rep(age, rep(4, length(age)))))
newminers <- newminers[with(newminers, wt) > 0,]

fit <- vglm(cbind(bln,wheeze) ~ Age, loglinb2(zero = NULL),
            weight = wt, data = newminers)
coef(fit, matrix = TRUE)  # Same! (at least for the log odds-ratio)
summary(fit)

# Try reconcile this with McCullagh and Nelder (1989), p.234
(0.166-0.131) / 0.027458   # 1.275 is approximately 1.25



