library(PairedData)


### Name: Meat
### Title: Meat data from Preece (1982, Table 4)
### Aliases: Meat
### Keywords: datasets

### ** Examples

data(Meat)

# Presence of clusters or...
with(Meat,plot(paired(AOAC,Babcock)))

# group effect according to Meat type?
with(Meat,plot(paired(AOAC,Babcock),group=MeatType))
with(Meat,plot(paired(AOAC,Babcock),group=MeatType,facet=FALSE))



