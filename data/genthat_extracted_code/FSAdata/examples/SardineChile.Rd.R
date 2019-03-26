library(FSAdata)


### Name: SardineChile
### Title: Ages and lengths of two year-classes of Sardine from Chilean
###   waters.
### Aliases: SardineChile
### Keywords: datasets

### ** Examples

data(SardineChile)
str(SardineChile)
head(SardineChile)
SardineChile$age <- SardineChile$age.mon/12
plot(tl.cm~age,data=SardineChile)




