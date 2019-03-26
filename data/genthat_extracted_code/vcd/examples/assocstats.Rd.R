library(vcd)


### Name: assocstats
### Title: Association Statistics
### Aliases: assocstats summary.assocstats print.assocstats
###   print.summary.assocstats
### Keywords: category

### ** Examples

data("Arthritis")
tab <- xtabs(~Improved + Treatment, data = Arthritis)
summary(assocstats(tab))

assocstats(UCBAdmissions)



