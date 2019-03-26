# The 'isoscape' example without building the sphere 
if(getOption_IsoriX("example_maxtime") > 30) {
  
  ## We prepare the data
  GNIPDataDEagg <- prepsources(data = GNIPDataDE)
  
  ## We fit the models
  GermanFit <- isofit(data = GNIPDataDEagg,
                      mean_model_fix = list(elev = TRUE, lat_abs = TRUE))
  
  ## We build the isoscapes
  GermanScape <- isoscape(raster = ElevRasterDE, isofit = GermanFit)
  
  GermanScape
  plot(GermanScape)
  
  ## We build more plots
  PlotMean <- plot(x = GermanScape, which = "mean", plot = FALSE)
  
  PlotMeanPredVar <- plot(x = GermanScape, which = "mean_predVar", plot = FALSE)
  
  PlotMeanResidVar <- plot(x = GermanScape, which = "mean_residVar", plot = FALSE)
  
  PlotMeanRespVar <- plot(x = GermanScape, which = "mean_respVar", plot = FALSE)
  
  ## We display the plots
  print(PlotMean, split = c(1, 1, 2, 2), more = TRUE)
  print(PlotMeanPredVar,  split = c(2, 1, 2, 2), more = TRUE)
  print(PlotMeanResidVar, split = c(1, 2, 2, 2), more = TRUE)
  print(PlotMeanRespVar,  split = c(2, 2, 2, 2), more = FALSE)
}