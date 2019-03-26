library(dmm)


### Name: gprint.dmm
### Title: Print method for genetic parameters contained in an object of
###   class 'dmm'.
### Aliases: gprint.dmm
### Keywords: methods print

### ** Examples


library(dmm)
data(sheep.df)
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A","D"))

# make a simple fit object - OLS-b only
sheep.fit1 <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
    components=c("VarE(I)","VarG(Ia)"))
# look at parameters for two traits
gprint(sheep.fit1,traitset=c("Cww","Diam"))
rm(sheep.fit1)
rm(sheep.mdf)
rm(sheep.df)



