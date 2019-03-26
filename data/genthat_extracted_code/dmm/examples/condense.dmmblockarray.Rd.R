library(dmm)


### Name: condense.dmmblockarray
### Title: Condense an object of type 'dmmblockarray' to an object of type
###   'dmm'
### Aliases: condense.dmmblockarray
### Keywords: multivariate methods misc

### ** Examples

library(dmm)
# prepare the dataset sheep.df
data(sheep.df)
# add a matrix 'Ymat' to the dataframe, which is required for traitsblockwise
# keep=TRUE also required
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),keep=TRUE)
# make sheep.fit as a class dmmarray object
sheep.fit <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
    components=c("VarE(I)","VarG(Ia)"),traitsblockwise=TRUE,
    Block1=c("Cww","Diam"),Block2="Bwt")
#  look at one element of the dmmblockarray
summary(sheep.fit$array[["Block1","Block2"]])
# condense the dmmblockarray to a class dmm object
sheep.condense <- condense.dmmblockarray(sheep.fit)
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




