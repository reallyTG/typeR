library(Repliscope)


### Name: smoothRatio
### Title: A function to smooth ratio values using cubic smoothing spline
###   smoothRatio function splits values from 'ratio' column by chromosome
###   and based the supplied 'groupMin' and 'split' parameters and then
###   applies smooth.spline() function from R stats package. The supplied
###   dataframe may contain multiple ratios, i.e. ratios produced using
###   multiple replicating samples and/or multiple non-replicating samples.
###   This must be reflected in 'name.rep' and 'name.nonRep' columns. In
###   other words, different ratio dataframes may be merged using rbind()
###   function before calling smoothRatio() function.
### Aliases: smoothRatio
### Keywords: bioinformatics genomics replication spline

### ** Examples

ratioDF <- smoothRatio(W303norm)



