library(funHDDC)


### Name: plot.mfpca
### Title: Graphical representation for MFPCA
### Aliases: plot.mfpca

### ** Examples


  ####Univariate case: "Canadian temperature" data (Ramsey & Silverman)
  daybasis65 <- create.fourier.basis(c(0, 365), nbasis=65, period=365)
  daytempfd <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"], daybasis65,
                            fdnames=list("Day", "Station", "Deg C"))$fd

  res.pca<-mfpca(daytempfd)
  plot(res.pca,nharm=4)


  ####Multivariate case: "Canadian temperature" data (Ramsey & Silverman)
  daybasis65 <- create.fourier.basis(c(0, 365), nbasis=65, period=365)
  daytempfd <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"], daybasis65,
                            fdnames=list("Day", "Station", "Deg C"))$fd
  dayprecfd<-smooth.basis(day.5, CanadianWeather$dailyAv[,,"Precipitation.mm"], daybasis65,
                          fdnames=list("Day", "Station", "Mm"))$fd

  res.pca<-mfpca(list(daytempfd,dayprecfd))
  plot(res.pca,nharm=4)




