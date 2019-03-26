library(Cprob)


### Name: cpfpo
### Title: Proportional-odds Model for the Conditional Probability Function
### Aliases: cpfpo
### Keywords: survival regression

### ** Examples

data(mgus)
mgus$A <- ifelse(mgus$age < 64, 0, 1)

## fit the model for 2 covariates
fit.cpfpo <- cpfpo(Hist(time, ev)~factor(A) + creat,
                   data = mgus, tis=seq(10, 30, 0.3),
                   w=rep(1,67))
## and plot the odds-ratios
if(require("lattice")) {
xyplot(fit.cpfpo, scales = list(relation = "free"), layout = c(3, 1))
}



