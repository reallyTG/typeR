library(coefficientalpha)


### Name: plot.alpha
### Title: Alpha/Omega related plot
### Aliases: plot.alpha plot.omega plot

### ** Examples

data(example)

res<-alpha(example, varphi=.01)
## diagnostic plot
plot(res, type='d')

## alpha with varphi=.01 & standard error
res<-alpha(example, varphi=.01, se=TRUE)
## confidence interval
summary(res)

## weight plot
plot(res)
# or
plot(res, type='w')

## profile plot
plot(res, type='p')



