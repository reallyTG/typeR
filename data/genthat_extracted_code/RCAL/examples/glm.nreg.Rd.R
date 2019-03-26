library(RCAL)


### Name: glm.nreg
### Title: Non-regularied M-estimation for fitting generalized linear
###   models
### Aliases: glm.nreg

### ** Examples

data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

# include only 10 covariates
x2 <- x[,1:10]

ps.ml <- glm.nreg(y=tr, x=x2, loss="ml")
check.ml <- mn.ipw(x2, tr, ps.ml$fit)
check.ml

ps.cal <- glm.nreg(y=tr, x=x2, loss="cal")
check.cal <- mn.ipw(x2, tr, ps.cal$fit)
check.cal  # should be numerically 0

ps.bal <- glm.nreg(y=tr, x=x2, loss="bal")
check.bal <- mn.ipw(x2, tr, ps.bal$fit)
check.bal




