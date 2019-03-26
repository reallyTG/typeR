library(VGAM)


### Name: posbernUC
### Title: Positive Bernoulli Sequence Model
### Aliases: posbernUC dposbern rposbern
### Keywords: distribution datagen

### ** Examples

rposbern(n = 10)
attributes(pdata <- rposbern(n = 100))
M.bh <- vglm(cbind(y1, y2, y3, y4, y5) ~ x2 + x3, posbernoulli.b(I2 = FALSE),
             data = pdata, trace = TRUE)
constraints(M.bh)
summary(M.bh)



