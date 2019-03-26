# The 'isoscape' example without the additional calibration fits
if(getOption_IsoriX("example_maxtime") > 10) {
  GNIPDataDEagg <- prepsources(data = GNIPDataDE)
  
  ## We fit the models for Germany:
  GermanFit <- isofit(data = GNIPDataDEagg,
                      mean_model_fix = list(elev = TRUE, lat_abs = TRUE))
  
  ## We fit the calibration model:
  CalibAlien <- calibfit(data = CalibDataAlien, isofit = GermanFit)
  
  ## We display minimal information:
  CalibAlien
  
  ## We display more information:
  summary(CalibAlien)
  
  ## We plot the calibration function:
  plot(CalibAlien)
}
