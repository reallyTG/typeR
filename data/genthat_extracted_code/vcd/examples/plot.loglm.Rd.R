library(vcd)


### Name: plot.loglm
### Title: Visualize Fitted Log-linear Models
### Aliases: plot.loglm assoc.loglm mosaic.loglm
### Keywords: hplot

### ** Examples

library(MASS)
## mosaic display for PreSex model
data("PreSex")
fm <- loglm(~ PremaritalSex * ExtramaritalSex * (Gender + MaritalStatus),
  data = aperm(PreSex, c(3, 2, 4, 1)))
fm
## visualize Pearson statistic
plot(fm, split_vertical = TRUE)
## visualize LR statistic
plot(fm, split_vertical = TRUE, residuals_type = "deviance")

## conditional independence in UCB admissions data
data("UCBAdmissions")
fm <- loglm(~ Dept * (Gender + Admit), data = aperm(UCBAdmissions))

## use mosaic display
plot(fm, labeling_args = list(abbreviate = c(Admit = 3)))

## and association plot
plot(fm, panel = assoc)
assoc(fm)



