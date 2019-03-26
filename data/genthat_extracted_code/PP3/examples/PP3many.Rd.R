library(PP3)


### Name: PP3many
### Title: Main function to carry out three-dimensional projection pursuit.
### Aliases: PP3many
### Keywords: multivariate

### ** Examples

#
# The flea beetle data
#
data(beetle)
#
# Run projection pursuit with 100 random starts (normally, you'd use MANY
# more random starts, e.g. 1000 or more. Here, we keep the number small to
# help CRAN
#
#
# N.b. I am going to set.seed here, so results match what you might see
# when trying THESE functions, but, in general, you can ignore set.seed
# or set it to your favourite value
#
set.seed(1)

beetle.PP3 <- PP3many(t(beetle), nrandstarts=100)
#
# Look at the output
#
beetle.PP3
#Class 'PP3' : Three-dimensional Projection Pursuit Object:
#		 ~~~  : List with 5 components with names
#		ix3 info pdata.list pseudp.vals origvarnames 
#
#Number of random start(s):  100 
#Maximum projection index is  22.02255  achieved by  1  random start(s).
#(Partial) list of those starts achieving max are:  90
#
#summary(.):
#----------
#   Summary statistics of projection index
#	 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#       11.51   14.81   16.18   16.34   17.89   22.02 
#   Summary statistics of pseudo p-values
#	Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#	8.592  10.885  12.361  12.466  13.992  18.210 
#
# The print out shows that 100 random starts were executed and the max
# projection index was 22.02255 and only one of those random starts found
# this (sometimes more than one random start converges to the same maximum).
#
# The index number of the run which found the maximum was 90 (this number
# can be useful later to access the maximum).
#
# The summary gives the summary statistics of the 100 projection index
# values found. The max is the same as above, but also the distribution
# can be discerned.
#
# The distribution of the pseudo-p-values (NOT actual p-values) is presented
# after that. These are the projection indices computed purely on random
# directions, not the optimised versions and so you can think of them as
# null values to compare the earlier optimised values. E.g. the maximum of
# the pseudo-projection indices is 18.21, so any actual optimised projection
# index larger than this might be interesting.
#
# Now produce a plot (using all projection index info on 100 runs):
#
## Not run: plot(beetle.PP3)
#
# This produces (a) a histogram of the projection indices (b) a red density
# estimate of the pseudo-projection indices and (c) the median, upper quartile,
# 0.9 quantile and maximum of the pseudos as red dotted vertical lines. The red
# information corresponds to a kind of null, and so projection indices larger
# than these values might be interesting. The plot also produces some text:
#
#Big Projection Indices
#Maximum Psuedo p-value:  18.2103 
#Index Number and associated projection indices
#      90       74        4       87       75       54       13        6 
#22.02255 21.36578 21.29397 20.86531 19.59663 19.42427 19.34596 19.26520 
#      23       60 
#19.22810 19.16459
#
# This is a list of the 10 biggest projection indices and their respective
# identity numbers (which one of the random starts generated it). These
# can be used in the plot function with a number argument to generate further
# information/plots about the projection solution. Note, the number of
# biggest projection indices can be controlled with the nbig argument of
# plot.PP3.
#
# Now suppose we wanted to look at the projection solution 74, which had the
# second-biggest projection index. We can plot the projected data with the
# following command:
#
## Not run: plot(beetle.PP3, number=74, colvec=dimnames(beetle)[[1]])
#
# The colvec supplies the group structure so the different species can
# be coloured differently. The label argument permits you to put text
# labels there, per point as well as colours.
#
# You can extract information from the beetle.PP3 object using the
# extractor functions, getPP3index, getPP3projdata and the variable loadings
# using getPP3loading. For example,
#
getPP3index(beetle.PP3, 74)
#      74 
#21.36578 
#
# gets the second largest projection index. The third-largest can be obtained
# by replacing 74 by 4, etc.



