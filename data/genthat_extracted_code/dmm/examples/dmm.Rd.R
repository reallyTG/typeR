library(dmm)


### Name: dmm
### Title: Fit a dyadic mixed model to pedigree data
### Aliases: dmm dmm.default
### Keywords: models multivariate

### ** Examples


library(dmm)
# Prepare the dataset sheep.df
data(sheep.df)
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A","D"))
# The above code renumbers the pedigree Id's, makes columns "Year","Tb","Sex"
#    into factors,
#    assembles columns "CWW",Diam","Bwt" into a matrix (called 'Ymat')
#    for multivariate processing,
#    and sets up the environmental, additive genetic, and dominance genetic
#    relationship matrices.

# a simple model with individual environmenmtal and 
#    additive genetic components (default)
sheep.fit <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
   components=c("VarE(I)","VarG(Ia)"),gls=TRUE)
# view the components and fixed effect coefficients ( 2 traits only)
summary(sheep.fit,traitset=c("Cww","Diam"),gls=TRUE)
# view the genetic parameters
gsummary(sheep.fit,traitset=c("Cww","Diam"))

rm(sheep.df)
rm(sheep.mdf)
rm(sheep.fit)

# Note: sheep.df is a small demo dataset. The results are illustrative, 
# but not meaningful.
# for a tutorial and fully documented examples see {\em dmmOverview.pdf}



