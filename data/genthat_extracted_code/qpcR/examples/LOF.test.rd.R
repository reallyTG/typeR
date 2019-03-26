library(qpcR)


### Name: LOF.test
### Title: Formal lack-Of-Fit test of a nonlinear model against a one-way
###   ANOVA model
### Aliases: LOF.test
### Keywords: models nonlinear

### ** Examples

## Example with a 'replist'
## no lack-of-fit.
ml1 <- modlist(reps, fluo = 2:5, model = l5)
rl1 <- replist(ml1, group = c(1, 1, 1, 1))
LOF.test(rl1)

## Example with a 'nls' fit
## => there is a lack-of-fit.
DNase1 <- subset(DNase, Run == 1)
fm1DNase1 <- nls(density ~ SSlogis(log(conc), Asym, xmid, scal), DNase1) 
LOF.test(fm1DNase1)



