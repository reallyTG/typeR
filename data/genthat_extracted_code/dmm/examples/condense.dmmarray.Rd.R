library(dmm)


### Name: condense.dmmarray
### Title: Condense an object of type 'dmmarray' to an object of type 'dmm'
### Aliases: condense.dmmarray
### Keywords: multivariate methods misc

### ** Examples

library(dmm)
# prepare the dataset sheep.df
data(sheep.df)
# add a matrix 'Ymat' to the dataframe, which is required for traitspairwise
# keep=TRUE is required
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),keep=TRUE)
# make sheep.fit as a class dmmarray object
sheep.fit <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
    components=c("VarE(I)","VarG(Ia)"),traitspairwise=TRUE)
#  look at one element of the dmmarray
summary(sheep.fit[["Cww","Diam"]])
# condense the dmmarray to a class dmm object
sheep.condense <- condense.dmmarray(sheep.fit)
# compute a response to selection
sheep.resp <- gresponse(sheep.condense,psd=list(dp=c(1,1,1)),effects=c("G(Ia)"))
# look at response object
summary(sheep.resp)
#cleanup
rm(sheep.df)
rm(sheep.mdf)
rm(sheep.fit)
rm(sheep.condense)
rm(sheep.resp)




