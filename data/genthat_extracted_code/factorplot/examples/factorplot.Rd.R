library(factorplot)


### Name: factorplot
### Title: Calculate Pairwise Differences
### Aliases: factorplot factorplot.lm factorplot.glm factorplot.glht
###   factorplot.summary.glht factorplot.multinom factorplot.eff
###   factorplot.default

### ** Examples

## for lm/glm
x <- as.factor(round(runif(1000, .5,5.5)))
levels(x) <- paste("lab", 1:20, sep="")
X <- model.matrix(~x)
Y <- X %*% rnorm(ncol(X),0,4) + rnorm(1000)
mod <- lm(Y ~ x)
fp <- factorplot(mod, factor.variable="x",  pval = 0.05, order="alph")

## for glht
library(multcomp)
mod.glht <- glht(mod, linfct = mcp('x' = 'Tukey'))
fp2 <- factorplot(mod.glht, adjust.method='single-step')

## for vector of values
b <- c(0, mod$coef[-1])
v <- rbind(0, cbind(0, vcov(mod)[-1,-1]))
names(b) <- colnames(v) <- rownames(v) <- mod$xlevels[["x"]]
fp3 <- factorplot(b, var=v, resdf=mod$df.residual)

## for multinomial logit
data(france)
library(nnet)
multi.mod <- multinom(vote ~ retnat + lrself + male + age, data=france)
fp4 <- factorplot(multi.mod, variable="lrself")



