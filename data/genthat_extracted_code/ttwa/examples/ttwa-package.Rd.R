library(ttwa)


### Name: ttwa-package
### Title: Travel To Work Area.
### Aliases: ttwa-package ttwa-package
### Keywords: package

### ** Examples

data(reunion_ttw) #commuting flow in Reunion island
zone_emploi<-ttwa(df=reunion_ttw,origin="HOME",
  destination="WORK", flow="FLOW",
  conti="CONTI",size_center=50000)
zone_emploi$statistic #Zoning quality 
# 4 centers : Saint-Denis, Saint-Paul, Saint-Pierre and Saint-Benoit
center_emploi<-ttwa(df=reunion_ttw,origin="HOME",
  destination="WORK",flow="FLOW",
  conti="CONTI",size_center=500000,
  list_center=c("97411","97415","97416","97410"))
center_emploi$statistic



