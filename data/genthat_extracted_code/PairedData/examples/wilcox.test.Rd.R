library(PairedData)


### Name: wilcox.test
### Title: Wilcoxon's signed rank test for paired data
### Aliases: wilcox.test wilcox.test.paired

### ** Examples

data(PrisonStress)
with(PrisonStress,wilcox.test(PSSbefore,PSSafter))
with(PrisonStress,wilcox.test(PSSbefore,PSSafter,paired=TRUE))
with(PrisonStress,wilcox.test(paired(PSSbefore,PSSafter)))



