## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  library("RPyGeo")
#  library("sf")
#  library("raster")
#  library("magrittr")

## ---- eval = FALSE-------------------------------------------------------
#  data(dem, package = "RQGIS")
#  data(nz, package = "spData")
#  writeRaster(dem, file.path(tempdir(), "dem.tif"), format = "GTiff")
#  st_write(nz, file.path(tempdir(), "nz.shp"))

## ---- eval=FALSE---------------------------------------------------------
#  arcpy <- rpygeo_build_env(workspace = tempdir(),
#                            overwrite = TRUE,
#                            extensions = "Spatial")

## ---- eval=FALSE---------------------------------------------------------
#  # codewords are case insensitive
#  arcpy$CheckExtension("spatial")
#  #> [1] Available

## ---- eval=FALSE---------------------------------------------------------
#  rpygeo_search(search_term = "Classify")
#  #> $toolbox
#  #> [1] "ClassifyLasByHeight_3d" "ClassifyLasGround_3d"   "Reclassify_3d"
#  #>
#  #> $sa
#  #> [1] "ClassifyRaster" "MLClassify"     "Reclassify"
#  #>
#  #> $main
#  #> [1] "ClassifyLasByHeight_3d" "ClassifyLasGround_3d"   "Reclassify_3d"
#  #>
#  #> $ddd
#  #> [1] "ClassifyLasByHeight" "ClassifyLasGround"   "Reclassify"

## ---- eval=FALSE---------------------------------------------------------
#  rpygeo_help(arcpy$Slope_3d)

## ---- eval=FALSE---------------------------------------------------------
#  arcpy$Slope_3d(in_raster = "dem.tif", out_raster = "slope.tif")
#  #>C:\Users\janne\AppData\Local\Temp\RtmpyWYrL1\slope.tif

## ---- eval=FALSE---------------------------------------------------------
#  slope <- rpygeo_load("slope.tif")
#  plot(slope)

## ----slope, echo=FALSE, fig.cap="Slope computed with `Slope_3d()`"-------
knitr::include_graphics("slope.png")

## ---- eval = FALSE-------------------------------------------------------
#  arcpy$Dissolve_management(in_features = "nz.shp",
#                            out_feature_class = "nz_island.shp",
#                            dissolve_field = "Island") %>%
#    arcpy$PolygonToLine_management("nz_border.shp")
#  #>C:\Users\janne\AppData\Local\Temp\RtmpqGHdyf\nz_border.shp

## ----nz, echo=FALSE, fig.cap="Regions of `nz` (left), `nz` polygons dissolved by island (middle), `nz` polygons converted to lines (right).", out.width="75%"----
knitr::include_graphics("nz.png")

## ---- eval=FALSE---------------------------------------------------------
#  arcpy$sa$Slope(in_raster = "dem.tif")
#  #>C:\Users\janne\AppData\Local\Temp\RtmpqGHdyf/scratch\Slope_dem1.tif

## ---- eval=FALSE---------------------------------------------------------
#  arcpy$sa$Slope(in_raster = "dem.tif") %>%
#    rpygeo_save("slope.tif")

## ---- eval=FALSE---------------------------------------------------------
#  ras <- arcpy$sa$Raster("dem.tif")
#  class(ras)
#  #> [1] "python.builtin.Raster" "python.builtin.object"
#  
#  ras %rpygeo_+% 2 %>%
#    rpygeo_save("dem_2.tif")

