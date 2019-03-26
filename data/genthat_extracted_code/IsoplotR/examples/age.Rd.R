library(IsoplotR)


### Name: age
### Title: Calculate isotopic ages
### Aliases: age age.default age.UPb age.PbPb age.ArAr age.KCa age.UThHe
###   age.fissiontracks age.ThU age.ReOs age.SmNd age.RbSr age.LuHf

### ** Examples

data(examples)
tUPb <- age(examples$UPb,type=1)
tconc <- age(examples$UPb,type=2)
tdisc <- age(examples$UPb,type=3)
tArAr <- age(examples$ArAr)
tiso <- age(examples$ArAr,isochron=TRUE,i2i=TRUE)
tcentral <- age(examples$FT1,central=TRUE)



