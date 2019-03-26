library(gnm)


### Name: profile.gnm
### Title: Profile Deviance for Parameters in a Generalized Nonlinear Model
### Aliases: profile.gnm plot.profile.gnm
### Keywords: models nonlinear

### ** Examples

set.seed(1)

### Example in which deviance is near quadratic
count <- with(voting, percentage/100 * total)
yvar <- cbind(count, voting$total - count)
classMobility <- gnm(yvar ~ -1 + Dref(origin, destination),
                     constrain = "delta1", family = binomial,
                     data = voting)
prof <- profile(classMobility, trace = TRUE)
plot(prof)
## confint similar to MLE +/- 1.96*s.e. 
confint(prof, trace = TRUE)
coefData <- se(classMobility)
cbind(coefData[1] - 1.96 * coefData[2], coefData[1] + 1.96 * coefData[2])

## Not run: 
##D ### These examples take longer to run
##D ### Another near quadratic example
##D RChomog <- gnm(Freq ~ origin + destination + Diag(origin, destination) +
##D                MultHomog(origin, destination),
##D                ofInterest = "MultHomog", constrain = "MultHomog.*1",
##D                family = poisson, data = occupationalStatus)
##D prof <- profile(RChomog, trace = TRUE)
##D plot(prof)
##D ## confint similar to MLE +/- 1.96*s.e. 
##D confint(prof)
##D coefData <- se(RChomog)
##D cbind(coefData[1] - 1.96 * coefData[2], coefData[1] + 1.96 * coefData[2])
##D 
##D ## Another near quadratic example, with more complex constraints
##D count <- with(voting, percentage/100 * total)
##D yvar <- cbind(count, voting$total - count)
##D classMobility <- gnm(yvar ~ -1 + Dref(origin, destination), 
##D                      family = binomial, data = voting)
##D wts <- prop.table(exp(coef(classMobility))[1:2])
##D classMobility <- update(classMobility, constrain = "delta1",
##D                         constrainTo = log(wts[1]))
##D sum(exp(parameters(classMobility))[1:2]) #=1
##D prof <- profile(classMobility, trace = TRUE)
##D plot(prof)
##D ## confint similar to MLE +/- 1.96*s.e. 
##D confint(prof, trace = TRUE)
##D coefData <- se(classMobility)
##D cbind(coefData[1] - 1.96 * coefData[2], coefData[1] + 1.96 * coefData[2])
##D 
##D ### An example showing asymptotic deviance
##D unidiff <- gnm(Freq ~ educ*orig + educ*dest +
##D                Mult(Exp(educ), orig:dest),
##D                ofInterest = "[.]educ", constrain = "[.]educ1",
##D                family = poisson, data = yaish, subset = (dest != 7))
##D prof <- profile(unidiff, trace = TRUE)
##D plot(prof)
##D ## clearly not quadratic for Mult1.Factor1.educ4 or Mult1.Factor1.educ5!
##D confint(prof)
##D ##                          2.5 %     97.5 %
##D ## Mult(Exp(.), orig:dest).educ1         NA         NA
##D ## Mult(Exp(.), orig:dest).educ2 -0.5978901  0.1022447
##D ## Mult(Exp(.), orig:dest).educ3 -1.4836854 -0.2362378
##D ## Mult(Exp(.), orig:dest).educ4 -2.5792398 -0.2953420
##D ## Mult(Exp(.), orig:dest).educ5       -Inf -0.7006889
##D coefData <- se(unidiff)
##D cbind(coefData[1] - 1.96 * coefData[2], coefData[1] + 1.96 * coefData[2])
##D 
##D ### A far from quadratic example, also with eliminated parameters
##D backPainLong <- expandCategorical(backPain, "pain")
##D 
##D oneDimensional <- gnm(count ~ pain + Mult(pain, x1 + x2 + x3),
##D                       eliminate = id,  family = "poisson",
##D                       constrain = "[.](painworse|x1)", constrainTo = c(0, 1),
##D                       data = backPainLong)
##D prof <- profile(oneDimensional, trace = TRUE)
##D plot(prof)
##D ## not quadratic for any non-eliminated parameter
##D confint(prof)
##D coefData <- se(oneDimensional)
##D cbind(coefData[1] - 1.96 * coefData[2], coefData[1] + 1.96 * coefData[2])
## End(Not run)



