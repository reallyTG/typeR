library(ensembleBMA)


### Name: verifRankHist
### Title: Verification Rank and Histogram
### Aliases: verifRankHist
### Keywords: models

### ** Examples

  data(srft)

  labels <- c("CMCG","ETA","GASP","GFS","JMA","NGPS","TCWB","UKMO")

  srftData <- ensembleData( forecasts = srft[ ,labels],
                            dates = srft$date,
                            observations = srft$obs,
                            latitude = srft$lat,
                            longitude = srft$lon,
                            forecastHour = 48,
                            initializationTime = "00")

  use <- ensembleValidDates(srftData) >= "2004013000"

  verifRankHist( ensembleForecasts(srftData[use,]),
                 dataVerifObs(srftData[use,]))



