library(StatDA)


### Name: rg.mvalloc
### Title: Robust Multivariate Allocation Procedure
### Aliases: rg.mvalloc
### Keywords: multivariate robust

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

res.zone1=rg.mva(as.matrix(x[v==1,]))
res.zone2=rg.mva(as.matrix(x[v==2,]))
res.zone3=rg.mva(as.matrix(x[v==3,]))
res=rg.mvalloc(pcrit=0.01,x,res.zone1,res.zone2,res.zone3)



