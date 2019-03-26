library(IsoplotR)


### Name: isochron
### Title: Calculate and plot isochrons
### Aliases: isochron isochron.default isochron.ArAr isochron.KCa
###   isochron.PbPb isochron.RbSr isochron.ReOs isochron.SmNd isochron.LuHf
###   isochron.ThU isochron.UThHe

### ** Examples

data(examples)
isochron(examples$ArAr)

fit <- isochron(examples$PbPb,inverse=FALSE,plot=FALSE)

dev.new()
isochron(examples$ThU,type=4)



