library(dmm)


### Name: make.countarray
### Title: Count the number of observations in a dataframe or an 'mdf'
###   object for all traitpairs in the supplied list of traits.
### Aliases: make.countarray
### Keywords: Methods Misc Multivariate

### ** Examples

library(dmm)
# prepare the dataset sheep.df
data(sheep.df)
# count the observations
countarray <- make.countarray(sheep.df,c("Cww","Diam","Bwt"))
# lookat the counts
print(countarray)
#cleanup
rm(sheep.df)
rm(countarray)



