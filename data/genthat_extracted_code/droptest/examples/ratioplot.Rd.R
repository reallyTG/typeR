library(droptest)


### Name: ratioplot
### Title: Creates plot of pass/fail ratio for repeated test series.
### Aliases: ratioplot

### ** Examples

 # recommended to use num.series value greater than or equal to 1000.
 ratioplot(simq = seq(0.01, 0.20, by = 0.01), num.series = 100)
 ratioplot(simq = seq(0.01, 0.20, by = 0.01), num.series = 100,
           colors = c("BLUE", "BLACK"))
           



