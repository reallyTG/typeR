library(StatDA)


### Name: rg.mva
### Title: Non-robust Multivariate Data Analysis
### Aliases: rg.mva
### Keywords: multivariate

### ** Examples

#input data
data(ohorizon)
vegzn=ohorizon[,"VEG_ZONE"]
veg=rep(NA,nrow(ohorizon))
veg[vegzn=="BOREAL_FOREST"] <- 1
veg[vegzn=="FOREST_TUNDRA"] <- 2
veg[vegzn=="SHRUB_TUNDRA"] <- 3
veg[vegzn=="DWARF_SHRUB_TUNDRA"] <- 3
veg[vegzn=="TUNDRA"] <- 3
el=c("Ag","Al","As","B","Ba","Bi","Ca","Cd","Co","Cu","Fe","K","Mg","Mn",
  "Na","Ni","P","Pb","Rb","S","Sb","Sr","Th","Tl","V","Y","Zn")
x <- log10(ohorizon[!is.na(veg),el])
v <- veg[!is.na(veg)]

rg.mva(as.matrix(x[v==1,]))




