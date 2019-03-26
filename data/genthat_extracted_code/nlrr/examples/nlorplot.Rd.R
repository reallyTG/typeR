library(nlrr)


### Name: nlorplot
### Title: Odds ratio plot for dose - response non-linear continuous
###   exposure.
### Aliases: nlorplot

### ** Examples

sum1 <- nlor('dm', 'lipid', covar = c('age', 'gender'), 0.6, data = Lipid)
head(sum1)
nlorplot('lipid', 'or', data = sum1, xlab = 'Lipid')



