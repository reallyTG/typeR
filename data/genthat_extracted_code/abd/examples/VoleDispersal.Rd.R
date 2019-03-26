library(abd)


### Name: VoleDispersal
### Title: Home Range Size in Field Voles
### Aliases: VoleDispersal
### Keywords: datasets

### ** Examples

xtabs(count~sex+homeranges,VoleDispersal)
barchart( xtabs(count~sex+homeranges,VoleDispersal), origin=0, auto.key=TRUE)
barchart(count~sex+homeranges,VoleDispersal, origin=0)
barchart(count~sex,groups=homeranges,VoleDispersal, origin=0)
barchart(count~sex,groups=homeranges,VoleDispersal, origin=0,stack=TRUE)



