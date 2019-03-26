library(meta)


### Name: as.data.frame.meta
### Title: Additional functions for objects of class meta
### Aliases: as.data.frame.meta
### Keywords: print

### ** Examples

data(Fleiss93cont)
#
# Generate additional variable with grouping information
#
Fleiss93cont$group <- c(1,2,1,1,2)
#
# Do meta-analysis without grouping information
#
meta1 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c, study,
                  data=Fleiss93cont, sm="SMD")
#
# Update meta-analysis object and do subgroup analyses
#
summary(update(meta1, byvar=group))

#
# Same result using metacont function directly
#
meta2 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c, study,
                  data=Fleiss93cont, sm="SMD", byvar=group)
summary(meta2)

#
# Compare printout of the following two commands
#
as.data.frame(meta1)
meta1$data



