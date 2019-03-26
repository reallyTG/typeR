library(ClassComparison)


### Name: Sam-class
### Title: Class "Sam"
### Aliases: Sam Sam-class countSignificant,Sam-method
###   plot,Sam,missing-method selectSignificant,Sam-method
###   summary,Sam-method
### Keywords: classes

### ** Examples

showClass("Sam")
ng <- 10000
ns <- 50
nd <- 100
dat <- matrix(rnorm(ng*ns), ncol=ns)
dat[1:nd, 1:(ns/2)] <- dat[1:nd, 1:(ns/2)] + 2
dat[(nd+1):(2*nd), 1:(ns/2)] <- dat[(nd+1):(2*nd), 1:(ns/2)] - 2
cla <- factor(rep(c('A', 'B'), each=25))

res <- Sam(dat, cla)
plot(res)

plot(res, tracks=1:3)

summary(res)
summary(res, cutoff=2)

a <- summary(res)
plot(a@significant.calls)
plot(a@significant.calls[1:300])

countSignificant(res, 1)



