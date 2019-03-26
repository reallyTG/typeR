library(far)


### Name: is.na.fdata
### Title: Not Available / "Missing" Values
### Aliases: is.na.fdata
### Keywords: NA

### ** Examples

  # Reading of the data
  library(stats)
  data(UKDriverDeaths)
  UKDriverDeaths[20]<-NA

  # Making the data of class 'fdata'
  fUKDriverDeaths <- as.fdata(UKDriverDeaths,col=1,p=12,dates=1969:1984,
                            name="UK Driver Deaths")
  summary(fUKDriverDeaths)
  is.na(fUKDriverDeaths)



