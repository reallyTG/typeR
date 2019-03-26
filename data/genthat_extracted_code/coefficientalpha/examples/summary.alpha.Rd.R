library(coefficientalpha)


### Name: summary.alpha
### Title: Print alpha/omega and its confidence interval.
### Aliases: summary summary.alpha summary.omega

### ** Examples

data(example)

res<-alpha(example, varphi=.01)
## diagnostic plot
plot(res, type='d')

## alpha with varphi=.01 & standard error
res<-alpha(example, varphi=.01, se=TRUE)
## confidence interval
summary(res)



