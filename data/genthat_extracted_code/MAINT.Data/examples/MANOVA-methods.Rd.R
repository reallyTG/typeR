library(MAINT.Data)


### Name: MANOVA-methods
### Title: Methods for Function MANOVA in Package 'MAINT.Data'
### Aliases: MANOVA MANOVA-methods MANOVA,IData-method H0res
###   H0res,IdtMANOVA-method H1res H1res,IdtMANOVA-method
###   show,IdtMANOVA-method
### Keywords: methods MANOVA interval data likelihood ratio tets

### ** Examples


#Create an Interval-Data object containing the intervals of temperatures by quarter 
# for 899 Chinese meteorological stations.
ChinaT <- IData(ChinaTemp[1:8])

#MANOVA tests assuming that one of C2, C3 or C4 restricted configuration cases hold

#Classical (homocedastic) MANOVA tests

ManvChina <- MANOVA(ChinaT,ChinaTemp$GeoReg,CovCase=2:4)
cat("China, MANOVA by geografical regions results =\n")
print(ManvChina)

#Heterocedastic MANOVA tests

HetManvChina <- MANOVA(ChinaT,ChinaTemp$GeoReg,Mxt="Het",CovCase=2:4)
cat("China, heterocedastic MANOVA by geografical regions results =\n")
print(HetManvChina)

#Skew-Normal based MANOVA assuming the the groups differ only according to location parameters
## Not run: 
##D 
##D SKNLocManvChina <- MANOVA(ChinaT,ChinaTemp$GeoReg,Model="SKNormal",Mxt="Loc",CovCase=2:4)
##D cat("China, Skew-Normal MANOVA (location model) by geografical regions results =\n")
##D print(SKNLocManvChina)
##D 
##D #Skew-Normal based MANOVA assuming the the groups may differ in all parameters
##D 
##D SKNGenManvChina <- MANOVA(ChinaT,ChinaTemp$GeoReg,Model="SKNormal",Mxt="Gen",CovCase=2:4)
##D cat("China, Skew-Normal MANOVA (general model)  by geografical regions results =\n")
##D print(SKNGenManvChina)
##D 
## End(Not run)




