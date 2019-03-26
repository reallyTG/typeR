library(EcoGenetics)


### Name: eco.pairtest
### Title: Kruskall - Wallis + Wilcoxon (Mann-Whitney U) and aov +
###   Tukey-HSD tests for an ecogen object
### Aliases: eco.pairtest

### ** Examples

## Not run: 
##D data(eco3)
##D wil <- eco.pairtest(eco = eco3, df = "P", x = "structure")
##D wil
##D wil <- eco.pairtest(eco = eco3,df = "E", x = "structure")
##D wil
##D wil <- eco.pairtest(eco = eco3, df = "P", x = "structure", only.p = FALSE)
##D wil
##D wil <- eco.pairtest(eco = eco3,df = "P", x = "structure", test = "tukey")
##D wil
## End(Not run)




