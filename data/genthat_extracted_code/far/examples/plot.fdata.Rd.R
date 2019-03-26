library(far)


### Name: plot.fdata
### Title: Plot Functional Data
### Aliases: plot.fdata
### Keywords: ts aplot

### ** Examples

  # Reading of the data
  library(stats)
  data(UKDriverDeaths)

  # Making the data of class 'fdata'
  fUKDriverDeaths <- as.fdata(UKDriverDeaths, col=1, p=12,
                            dates=1969:1984,
                            name="UK Driver Deaths")
  summary(fUKDriverDeaths)

  # plotting of the data : whole and 1 year
  par(mfrow=c(2,1))
  plot(fUKDriverDeaths, xval=1969+(1:192)/12,
       whole=TRUE, name="Whole Evolution : ", separator=TRUE)
  plot(fUKDriverDeaths, date="1984", xval=1:12,
       name="Evolution during year 1984 : ")



