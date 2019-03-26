library(robreg3S)


### Name: robreg3S
### Title: Robust regression estimation and inference in the presence of
###   cellwise and casewise contamination
### Aliases: robreg3S coef.robreg3S print.robreg3S summary.robreg3S
###   confint.robreg3S

### ** Examples

## Boston housing data
data(Boston, package="MASS")
boston <- Boston; rm(Boston)
boston$crim <- log(boston$crim)
boston$nox <- boston$nox^2
boston$rm <- boston$rm^2
boston$dis <- log(boston$dis)
boston$lstat <- log(boston$lstat)
boston$medv <- log(boston$medv)
boston$black <- boston$black/1000
boston$age <- boston$age/100
boston$tax <- boston$tax/100
boston$indus <- boston$indus/100
boston <- subset( boston, select=c(medv, crim, nox, rm, age, dis, tax, ptratio, black, lstat) )

## LS, MM, 3S
set.seed(100)
fit.LS <- lm(medv ~  ., data=boston)
fit.MM <- robustbase::lmrob(medv ~  ., data=boston)
fit.2S <- robreg3S( y=boston$medv, x=as.matrix(subset(boston,select=-medv)), filter = FALSE )
fit.3S <- robreg3S( y=boston$medv, x=as.matrix(subset(boston,select=-medv)) )

## Compare estimated coefficients
nrow(boston) *sum(( coef(fit.LS)[-1] - coef(fit.3S)[-1])^2* apply(boston[,-1], 2, mad)^2)
nrow(boston) *sum(( coef(fit.MM)[-1] - coef(fit.3S)[-1])^2* apply(boston[,-1], 2, mad)^2)
nrow(boston) *sum(( coef(fit.2S)[-1] - coef(fit.3S)[-1])^2* apply(boston[,-1], 2, mad)^2)

## Summary table
summary(fit.3S)




