## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(error = TRUE, warning=FALSE, message=FALSE, fig.path='figs/')
library("geodetector")
data(CollectData)

## ----table1 ,echo = FALSE------------------------------------------------
  knitr::kable(
  head(CollectData[, 1:4], 6), booktabs = TRUE,
  caption = 'Table 1. Demo data in table format'
)

## ----image2, echo = FALSE, out.width='100%', fig.cap="Figure 2. Demo data in GIS format (a) NTDs prevalence *Y*, (b) Elevation *X<sub>1</sub>*, (c) Soil types *X<sub>2</sub>*, (d) Watersheds *X<sub>3</sub>*"----
knitr::include_graphics("./figs/fig-2.jpg")

## ---- eval=F-------------------------------------------------------------
#  install.packages("geodetector")

## ------------------------------------------------------------------------
library(geodetector)

## ------------------------------------------------------------------------
data(CollectData)

## ------------------------------------------------------------------------
class(CollectData)

## ------------------------------------------------------------------------
names(CollectData)

## ------------------------------------------------------------------------
factor_detector("incidence","elevation",CollectData) 

## ------------------------------------------------------------------------
factor_detector(1,3, CollectData)

## ---- eval=F-------------------------------------------------------------
#  factor_detector ("incidence",c("soiltype","watershed","elevation"),CollectData)

## ------------------------------------------------------------------------
factor_detector (1,c(2,3,4), CollectData)

## ------------------------------------------------------------------------
interaction_detector("incidence",c("soiltype","watershed","elevation"),CollectData)

## ------------------------------------------------------------------------
risk_detector("incidence","soiltype",CollectData)

## ------------------------------------------------------------------------
risk_detector(1,2, CollectData)

## ---- eval=F-------------------------------------------------------------
#  risk_detector("incidence",c("soiltype","watershed","elevation"),CollectData)

## ------------------------------------------------------------------------
risk_detector(1,c(2,3,4), CollectData)

## ------------------------------------------------------------------------
ecological_detector("incidence",c("soiltype","watershed"),CollectData)

## ------------------------------------------------------------------------
ecological_detector("incidence",c("soiltype","watershed","elevation"),CollectData)

## ------------------------------------------------------------------------
library(sp)
library(rgeos)
library(maptools)

## ------------------------------------------------------------------------
data(DiseaseData_shp)
data(SoilType_shp)
data(Watershed_shp)
data(Elevation_shp)

## ------------------------------------------------------------------------
CollectData2 <- maps2dataframe(DiseaseData_shp,c(SoilType_shp, Watershed_shp, 
                              Elevation_shp),namescolomn= c('incidence', 
                               'soiltype', 'watershed', 'elevation'))

head(CollectData2)

## ------------------------------------------------------------------------
risk_detector("incidence","soiltype",CollectData2)
risk_detector("incidence",c("soiltype"),CollectData2)

risk_detector(1,2,CollectData2)
risk_detector(1,c(2,3,4),CollectData2)

## ------------------------------------------------------------------------
factor_detector("incidence","elevation",CollectData2)
factor_detector ("incidence",c("elevation","watershed"),CollectData2)

factor_detector(1,3,CollectData2)
factor_detector (1,c(2,3,4),CollectData2)

## ------------------------------------------------------------------------
ecological_detector("incidence",c("soiltype","watershed"),CollectData2)
ecological_detector("incidence",c("soiltype","watershed","elevation"),CollectData2)

## ------------------------------------------------------------------------
interaction_detector("incidence",c("soiltype","watershed"),CollectData2)
interaction_detector("incidence",c("soiltype","watershed","elevation"),CollectData2)

## ---- eval=F-------------------------------------------------------------
#  Result_1 <- factor_detector ("incidence",c("soiltype","watershed", "elevation"),CollectData)
#  write.csv(Result_1 [[1]],'./Geodetector_R/
#            output_factor_detector_soiltype.csv')
#  write.csv(Result_1 [[2]],'./Geodetector_R/
#            output_factor_detector_watershed.csv')
#  write.csv(Result_1 [[3]],'./Geodetector_R/
#            output_factor_detector_elevation.csv')
#  
#  Result_2 <- risk_detector("incidence",c("soiltype","watershed"),
#                            CollectData)
#  write.csv(Result_2 [[1]][1],'./Geodetector_R/
#            output_risk_detector_soiltype_Mean.csv')
#  write.csv(Result_2 [[1]][2],'./Geodetector_R/
#            output_risk_detector_soiltype_Significance.csv')
#  write.csv(Result_2 [[2]][1],'./Geodetector_R/
#            output_risk_detector_watershed_Mean.csv')
#  write.csv(Result_2 [[2]][2],'./Geodetector_R/
#            output_risk_detector_watershed_Significance.csv')

## ---- eval=F-------------------------------------------------------------
#  Result_3 <- interaction_detector("incidence",c("soiltype","watershed",
#                                                 "elevation"),CollectData)
#  write.csv(Result_3,'./Geodetector_R/
#            output_interaction_detector.csv')
#  
#  Result_4 <- ecological_detector("incidence",c("soiltype","watershed"),
#                                  CollectData)
#  write.csv(Result_4,'./Geodetector_R/
#            output_ecological_detector.csv')

