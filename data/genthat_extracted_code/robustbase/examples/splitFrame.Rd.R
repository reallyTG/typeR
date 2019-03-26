library(robustbase)


### Name: splitFrame
### Title: Split Continuous and Categorical Predictors
### Aliases: splitFrame

### ** Examples

data(education)
education <- within(education, Region <- factor(Region))

## no interactions -- same split for all types:
fm1 <- lm(Y ~ Region + X1 + X2 + X3, education)
splt <- splitFrame(fm1$model)
str(splt)

## with interactions:
fm2 <- lm(Y ~ Region:X1:X2 + X1*X2, education)
s1 <- splitFrame(fm2$model, type="f"  )
s2 <- splitFrame(fm2$model, type="fi" )
s3 <- splitFrame(fm2$model, type="fii")
cbind(s1$x1.idx,
      s2$x1.idx,
      s3$x1.idx)
rbind(p.x1 = c(ncol(s1$x1), ncol(s2$x1), ncol(s3$x1)),
      p.x2 = c(ncol(s1$x2), ncol(s2$x2), ncol(s3$x2)))



