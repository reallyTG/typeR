library(gnm)


### Name: confint.gnm
### Title: Compute Confidence Intervals of Parameters in a Generalized
###   Nonlinear Model
### Aliases: confint.gnm confint.profile.gnm
### Keywords: models nonlinear

### ** Examples

### Example in which profiling doesn't take too long
count <- with(voting, percentage/100 * total)
yvar <- cbind(count, voting$total - count)
classMobility <- gnm(yvar ~ -1 + Dref(origin, destination),
                     constrain = "delta1", family = binomial,
                     data = voting)
## profile diagonal effects
confint(classMobility, parm = 3:7, trace = TRUE)

## Not run: 
##D ### Profiling takes much longer here, but example more interesting!
##D unidiff <- gnm(Freq ~ educ*orig + educ*dest +
##D                Mult(Exp(educ), orig:dest), 
##D                ofInterest = "[.]educ", constrain = "[.]educ1",
##D                family = poisson, data = yaish, subset = (dest != 7))
##D 
##D ## Letting 'confint' compute profile
##D confint(unidiff, trace = TRUE)
##D ##                                                   2.5 %     97.5 %
##D ## Mult(Exp(.), orig:dest).educ1         NA         NA
##D ## Mult(Exp(.), orig:dest).educ2 -0.5978901  0.1022447
##D ## Mult(Exp(.), orig:dest).educ3 -1.4836854 -0.2362378
##D ## Mult(Exp(.), orig:dest).educ4 -2.5792398 -0.2953420
##D ## Mult(Exp(.), orig:dest).educ5       -Inf -0.7007616
##D 
##D ## Creating profile object first with user-specified stepsize
##D prof <- profile(unidiff, trace = TRUE, stepsize = 0.1)
##D confint(prof, ofInterest(unidiff)[2:5])
##D ##                                    2.5 %     97.5 %
##D ## Mult(Exp(.), orig:dest).educ2 -0.5978324  0.1022441
##D ## Mult(Exp(.), orig:dest).educ3 -1.4834753 -0.2362138
##D ## Mult(Exp(.), orig:dest).educ4         NA -0.2950790
##D ## Mult(Exp(.), orig:dest).educ5         NA         NA
##D 
##D ## For 95% confidence interval, need to estimate parameters for which
##D ## z = +/- 1.96. Profile has not gone far enough for last two parameters
##D range(prof[[4]]$z)
##D ## -1.566601  2.408650
##D range(prof[[5]]$z)
##D ## -0.5751376  1.1989487
## End(Not run)



