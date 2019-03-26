library(IsoplotR)


### Name: kde
### Title: Create (a) kernel density estimate(s)
### Aliases: kde kde.default kde.UPb kde.detritals kde.PbPb kde.ArAr
###   kde.KCa kde.ThU kde.ReOs kde.SmNd kde.RbSr kde.LuHf kde.UThHe
###   kde.fissiontracks

### ** Examples

kde(examples$UPb)

dev.new()
kde(examples$FT1,log=TRUE)

dev.new()
kde(examples$DZ,from=1,to=3000,kernel="epanechnikov")



