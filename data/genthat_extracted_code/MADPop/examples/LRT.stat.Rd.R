library(MADPop)


### Name: LRT.stat
### Title: Likelihood ratio test statistic for contingency tables
### Aliases: LRT.stat

### ** Examples

# simple contingency table
ctab <- rbind(pop1 = c(5, 3, 0, 3),
                pop2 = c(4, 10, 2, 5))
colnames(ctab) <- LETTERS[1:4]
ctab
LRT.stat(ctab) # likelihood ratio statistic



