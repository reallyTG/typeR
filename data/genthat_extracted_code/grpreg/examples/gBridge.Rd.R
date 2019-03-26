library(grpreg)


### Name: gBridge
### Title: Fit a group bridge regression path
### Aliases: gBridge

### ** Examples

data(Birthwt)
X <- Birthwt$X
group <- Birthwt$group

## Linear regression
y <- Birthwt$bwt
fit <- gBridge(X, y, group)
plot(fit)
select(fit)

## Logistic regression
y <- Birthwt$low
fit <- gBridge(X, y, group, family="binomial")
plot(fit)
select(fit)



