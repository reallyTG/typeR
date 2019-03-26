library(dmm)


### Name: sheep.df
### Title: Demonstration sheep dataset
### Aliases: sheep.df
### Keywords: datasets

### ** Examples

library(dmm)
data(sheep.df)
str(sheep.df)
#do some preprocessing
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# The above code renumbers the pedigree Id's, makes columns "Year","Tb","Sex"
#    into factors,
#    assembles columns "CWW",Diam","Bwt" into a matrix (called 'Ymat')
#    for multivariate processing,
#    and sets up the environmental, and additive genetic
#    relationship matrices.
str(sheep.mdf)
#cleanup
rm(sheep.df)
rm(sheep.mdf)




