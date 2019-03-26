## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(meteoland)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("meteoland")
#  library(meteoland)

## ---- eval = FALSE-------------------------------------------------------
#  library(devtools)
#  install_github("miquelcaceres/meteoland", build_vignettes = TRUE)
#  library(meteoland)

## ---- echo = FALSE, include= FALSE---------------------------------------
data("exampleinterpolationdata")

st_names = row.names(exampleinterpolationdata@MinTemperature)
st_coords = exampleinterpolationdata@coords
st_data = data.frame(X_UTM = st_coords[,1], Y_UTM = st_coords[,2],
                     elevation = exampleinterpolationdata@elevation,
                     row.names = st_names)
tmin = exampleinterpolationdata@MinTemperature
tmax = exampleinterpolationdata@MaxTemperature                     
prec = exampleinterpolationdata@Precipitation 
rhum = exampleinterpolationdata@RelativeHumidity

## ------------------------------------------------------------------------
str(st_data)
head(st_data)

## ------------------------------------------------------------------------
dim(tmax)
dim(tmin)
dim(prec)
dim(rhum)
tmax[1:6,1:6]

## ------------------------------------------------------------------------
sp = SpatialPoints(st_data[,c("X_UTM", "Y_UTM")],
                   proj4string = CRS("+proj=utm +zone=31 +ellps=WGS84 +datum=WGS84 +units=m +towgs84=0,0,0"))
head(sp)

## ------------------------------------------------------------------------
interpolator <- MeteorologyInterpolationData(sp, elevation = st_data$elevation,
                                             MinTemperature = tmin,
                                             MaxTemperature = tmax,
                                             Precipitation = prec,
                                             RelativeHumidity = rhum)
class(interpolator)

## ------------------------------------------------------------------------
spatial_coverage <- interpolation.coverage(interpolator, type = 'spatial')
head(spatial_coverage)
temporal_coverage <- interpolation.coverage(interpolator, type = 'temporal')
head(temporal_coverage)

## ------------------------------------------------------------------------
names(interpolator@params)

## ------------------------------------------------------------------------
interpolator@params$initial_Rp

## ------------------------------------------------------------------------
tmin_cal <- interpolation.calibration(interpolator, variable = "Tmin",
                                      N_seq = 20,
                                      alpha_seq = seq(5, 10, by = 1),
                                      verbose = TRUE)

## ------------------------------------------------------------------------
interpolator@params$N_MinTemperature = tmin_cal$N
interpolator@params$alpha_MinTemperature = tmin_cal$alpha

## ----echo=FALSE----------------------------------------------------------
cv <- interpolation.cv(interpolator, verbose=T)

## ------------------------------------------------------------------------
summary(cv)

## ---- echo = FALSE, include= FALSE---------------------------------------
data("examplegridtopography")

elev = as(examplegridtopography[1:20,1:20], "SpatialGridDataFrame")["elevation"]

## ------------------------------------------------------------------------
summary(elev)

## ------------------------------------------------------------------------
sgt = SpatialGridTopography(as(elev, "SpatialGrid"), elevation = elev$elevation,
                            proj4string = elev@proj4string)
sgt

## ------------------------------------------------------------------------
spplot(sgt, "elevation")

## ------------------------------------------------------------------------
dates = as.Date(c("2001-02-03", "2001-06-03"))

## ------------------------------------------------------------------------
sum(!(dates %in% interpolator@dates))

## ------------------------------------------------------------------------
ml <- interpolationgrid(interpolator, sgt, dates)

## ------------------------------------------------------------------------
ml

## ---- fig.show="hold"----------------------------------------------------
spplot(ml, 2, "MinTemperature")
spplot(ml, 2, "MaxTemperature")

## ------------------------------------------------------------------------
df_1 = ml@data[[1]]
head(df_1)

## ------------------------------------------------------------------------
sgdf_1 = SpatialGridDataFrame(grid = ml@grid, data = ml@data[[1]], proj4string = ml@proj4string)
summary(sgdf_1)

## ---- echo = FALSE, include= FALSE---------------------------------------

spt = as(examplegridtopography, "SpatialPointsTopography")[c(36,228, 530, 2304)]
cc = coordinates(spt)
points_df = data.frame(X_UTM = cc[,1], Y_UTM = cc[,2], elevation = spt@data$elevation)

## ------------------------------------------------------------------------
points_df

## ------------------------------------------------------------------------
spt = SpatialPointsTopography(as.matrix(points_df[,c("X_UTM", "Y_UTM")]),
                              elevation = points_df$elevation,
                              proj4string = CRS("+proj=utm +zone=31 +ellps=WGS84 +datum=WGS84 +units=m +towgs84=0,0,0"))
spt

## ------------------------------------------------------------------------
mp = interpolationpoints(interpolator, spt)

## ------------------------------------------------------------------------
mp

## ---- fig =TRUE, fig.width=7, fig.height=5-------------------------------
meteoplot(mp, 1, "Precipitation", ylab="Precipitation (mm)", xlab="")

## ------------------------------------------------------------------------
df_1 = mp@data[[1]]
head(df_1)

## ------------------------------------------------------------------------
dt_4 = extractpointdates(mp, as.Date("2001-01-04"), verbose = FALSE)
dt_4

## ---- echo = FALSE, include= FALSE---------------------------------------
data("examplecorrectiondata")
coords = examplecorrectiondata@coords
pt_coords = data.frame(long = as.numeric(coords[,1]), lat = as.numeric(coords[,2]))
proj_dates = examplecorrectiondata@dates
ref_data = examplecorrectiondata@reference_data
proj_data = examplecorrectiondata@projection_data

## ------------------------------------------------------------------------
pt_coords

## ------------------------------------------------------------------------
length(ref_data)
length(proj_data)
head(ref_data[[1]])
head(proj_data[[1]])

## ------------------------------------------------------------------------
proj_dates = seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by="day")

## ------------------------------------------------------------------------
sp = SpatialPoints(pt_coords, CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
sp

## ------------------------------------------------------------------------
uncorrected = MeteorologyUncorrectedData(sp, ref_data, proj_data, proj_dates)

## ------------------------------------------------------------------------
historical  = mp
historical

## ------------------------------------------------------------------------
uncorrected@params

## ------------------------------------------------------------------------
uncorrected@params$varmethods$WindSpeed="none"

## ------------------------------------------------------------------------
projected = correctionpoints(uncorrected, historical)

## ------------------------------------------------------------------------
projected

## ---- fig=TRUE, fig.width=7, fig.height=5--------------------------------
#Plot predicted mean temperature for point 1
meteoplot(projected, 1, "MinTemperature", ylab="Temperature (Celsius)", ylim=c(-5,40), col="blue")
meteoplot(projected, 1, "MaxTemperature", add=TRUE, col="red")
#Add uncorrected mean temperature data (cell #3)
lines(uncorrected@dates,
      uncorrected@projection_data[[3]]$MinTemperature,
      col="blue", lty=3)
lines(uncorrected@dates,
      uncorrected@projection_data[[3]]$MaxTemperature,
      col="red", lty=3)
legend("topright", legend=c("corrected","uncorrected", "Maximum", "Minimum"), 
       col=c("black","black", "red","blue"), lty=c(1,3,1,1), bty="n")


