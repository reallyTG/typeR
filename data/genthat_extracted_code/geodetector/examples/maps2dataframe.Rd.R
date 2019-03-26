library(geodetector)


### Name: maps2dataframe
### Title: maps2dataframe
### Aliases: maps2dataframe
### Keywords: dataframe. or shipfile table to transform

### ** Examples

library(maptools)

data(DiseaseData_shp)
data(SoilType_shp)
data(Watershed_shp)
data(Elevation_shp)
CollectData2<-maps2dataframe(DiseaseData_shp,c(SoilType_shp, Watershed_shp,
                             Elevation_shp),namescolomn= c('incidence',
                             'soiltype', 'watershed', 'elevation'))

factor_detector("incidence","soiltype",CollectData2)
factor_detector(1,2,CollectData2)
factor_detector (1,c(2,3,4),CollectData2)
rst <- factor_detector ("incidence",c("soiltype","watershed"),CollectData2)
interaction_detector("incidence",c("soiltype","watershed"),CollectData2)
interaction_detector("incidence",c("soiltype","watershed","elevation"),CollectData2)

risk_detector("incidence","soiltype",CollectData2)
risk_detector(1,2,CollectData2)
risk_detector(1,c(2,3,4),CollectData2)
risk_detector("incidence",c("soiltype"),CollectData2)

ecological_detector("incidence",c("soiltype","watershed"),CollectData2)
ecological_detector("incidence",c("soiltype","watershed","elevation"),CollectData2)



