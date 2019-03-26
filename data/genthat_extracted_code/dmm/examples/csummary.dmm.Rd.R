library(dmm)


### Name: csummary.dmm
### Title: Make summary tables of (co)variance component estimates sorted
###   into class-specific classes for a dmm object.
### Aliases: csummary.dmm csummary
### Keywords: methods

### ** Examples


# get some data
data(sheep.df)
# prepare it - only need "E" and "A" relationship matrices
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# estimate (co)variance components  - VarG(Ia) is Sex-specific
sheep.fitc <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
              components=c("VarE(I)"),
              specific.components=list(Sex=c("VarG(Ia)")))
# look  at components within Sex classes 
csummary(sheep.fitc,bytrait=FALSE)
# look just at trait "Cww"
summary(sheep.fitc,traitset="Cww")
# cleanup
rm(sheep.df)
rm(sheep.mdf)
rm(sheep.fitc)




