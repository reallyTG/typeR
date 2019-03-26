library(funHDDC)


### Name: mfpca
### Title: Functional principal component analysis for univariate or
###   multivariate functional data
### Aliases: mfpca

### ** Examples


  ####Univariate case: "Canadian temperature" data (Ramsey & Silverman)
  daybasis65 <- create.fourier.basis(c(0, 365), nbasis=65, period=365)
  daytempfd <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"], daybasis65,
                                  fdnames=list("Day", "Station", "Deg C"))$fd

  res.pca<-mfpca(daytempfd)
  plot.mfpca(res.pca)


  ####Multivariate case: "Canadian temperature" data (Ramsey & Silverman)
  daybasis65 <- create.fourier.basis(c(0, 365), nbasis=65, period=365)
  daytempfd <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"], daybasis65,
                                  fdnames=list("Day", "Station", "Deg C"))$fd
  dayprecfd<-smooth.basis(day.5, CanadianWeather$dailyAv[,,"Precipitation.mm"], daybasis65,
                                fdnames=list("Day", "Station", "Mm"))$fd

  res.pca<-mfpca(list(daytempfd,dayprecfd))
  plot.mfpca(res.pca)




