library(FSAdata)


### Name: AnchovetaChile
### Title: Ages and lengths of Anchoveta from Chilean waters.
### Aliases: AnchovetaChile
### Keywords: datasets

### ** Examples

data(AnchovetaChile)
str(AnchovetaChile)
head(AnchovetaChile)
AnchovetaChile$age <- AnchovetaChile$age.mon/12
plot(tl.cm~age,data=AnchovetaChile)




