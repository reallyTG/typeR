library(dmm)


### Name: plot.dmm
### Title: Plot residuals from fitting dyadic model
### Aliases: plot.dmm
### Keywords: methods

### ** Examples

library(dmm)
data(sheep.df)
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# make a simple fit object - OLS-b only
sheep.fit1 <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
    components=c("VarE(I)","VarG(Ia)"),
    dmekeep=TRUE,dmekeepfit=TRUE)
# plot dyadic model residuals for all traits
plot(sheep.fit1)
#cleanup
rm(sheep.fit1)
rm(sheep.mdf)
rm(sheep.df)




