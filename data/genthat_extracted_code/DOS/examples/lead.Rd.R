library(DOS)


### Name: lead
### Title: Lead in Children
### Aliases: lead
### Keywords: datasets

### ** Examples

data(lead)
# Reproduces parts of Table 2 in Rosenbaum (2011)
senU(lead$dif,gamma=5.8,m=8,m1=5,m2=8)
senU(lead$dif,gamma=5,m=5,m1=4,m2=5)

# m=2, m1=2, m2=2 is the U-statistic that closely
# resembles Wilcoxon's signed rank test.  Note
# that the results are almost the same.
senWilcox(lead$dif,gamma=5) # In Table 2
senU(lead$dif,gamma=5,m=2,m1=2,m2=2)



