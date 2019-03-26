library(DEMEtics)


### Name: D.Jost-and-Gst.Nei
### Title: Comparing Populations - Differentiation and Fixation Indices
### Aliases: D.Jost Gst.Nei DEMEtics.env
### Keywords: nonparametric

### ** Examples

# loading data from the example files of this package

data(Example.transformed)
Example.t <- Example.transformed

data(Example.untransformed)
Example.u <- Example.untransformed

# Calculating mean Dest values (averaged over all populations) with
# p-values and confidence intervals using only 10 bootstrap resamplings

D.Jost("Example.t", bias="correct", object=TRUE, format.table=FALSE,
pm="overall", statistics="all", bt=10)

# Calculating pairwise Gst values without any statistics

Gst.Nei("Example.u", bias="uncorrected", object=TRUE, format.table=TRUE,
pm="pairwise", statistics="none")

# If you do not know where the results of these example tables have been
# saved, type getwd()



