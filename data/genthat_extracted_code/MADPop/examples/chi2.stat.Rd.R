library(MADPop)


### Name: chi2.stat
### Title: Chi-squared test statistic for contingency tables
### Aliases: chi2.stat

### ** Examples

# simple contingency table
ctab <- rbind(pop1 = c(5, 3, 0, 3),
                pop2 = c(4, 10, 2, 5))
colnames(ctab) <- LETTERS[1:4]
ctab
chi2.stat(ctab) # chi^2 test statistic



