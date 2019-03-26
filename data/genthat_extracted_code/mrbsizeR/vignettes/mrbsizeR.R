## ----packageload, echo=FALSE, results='hide', message=FALSE, warning=FALSE----
library(fields)
library(maps)
library(knitr)
library(mrbsizeR)

## ----strdata1, echo = FALSE, results = 'markup'--------------------------
# Structure of the dataset 
load(system.file("/extdata", "tas.su.1995.MM5I.rda", package = "mrbsizeR"))


## ----strdata2, echo = TRUE, results = 'markup'---------------------------
# Structure of the dataset 
str(tas.su.1995.MM5I)


## ----plotdata, echo = FALSE, results = 'markup', fig.cap = '\\label{fig:plotdata}Simulated surface air temperature in summer 1995 for the United States, the southern part of Canada and the northern part of Mexico. The unit of the temperature is degrees Celsius.', fig.width=5, fig.height=3----
par(mar = c(1, 1, 3, 1))
image.plot(tas.su.1995.MM5I$lon-360, tas.su.1995.MM5I$lat, 
           array(tas.su.1995.MM5I$su, dim(tas.su.1995.MM5I$lat)), 
           xlab="", ylab="", xaxt="n", yaxt="n", legend.shrink = 0.6, axis.args = list(cex.axis = 0.6))
title("Surface Air Temperature 1995 (MM5I)", cex.main = 0.8)
map(add = TRUE)

## ----recdata, echo = FALSE, results = 'markup', fig.cap = '\\label{fig:recdata}Simulated surface air temperature in summer 1995 for the United States, the southern part of Canada and the northern part of Mexico on a rectangular grid. Red describes warmer areas, colder areas are colored blue.', fig.height=4----
par(mar = c(1, 1, 3, 1))
image(tas.su.1995.MM5I$su, col = fields::tim.colors(), xaxt = 'n', yaxt = 'n', main = "Surface Air Temperature 1995 (MM5I)", cex.main = 0.8, asp = dim(tas.su.1995.MM5I$su)[2] / dim(tas.su.1995.MM5I$su)[1], bty = "n")

## ----Samples_t_dist1, echo = TRUE, eval = FALSE--------------------------
#  # Sampling from a multivariate t-distribution
#  tas.post.samp <- rmvtDCT(object = tas.su.1995.MM5I$su,
#                           lambda = 0.2, sigma = 36, nu0 = 15, ns = 1000)

## ----taperingplot1, echo=TRUE, eval=FALSE--------------------------------
#  # Plot of signal-independent tapering functions
#  TaperingPlot(lambdaSmoother = c(1, 100, 10000), mm = 120, nn = 98)

## ----taperingplot3, echo=TRUE, eval=FALSE--------------------------------
#  # Plot of signal-dependent tapering functions
#  TaperingPlot(lambdaSmoother = c(1, 100, 10000),
#               mm = 120, nn = 98, Xmu = tas.post.samp$mu)

## ----objectivefunc1, echo=TRUE, eval=FALSE-------------------------------
#  # Minimization of objective function with respect to the smoothing parameters
#  tas.min.lambda.out <- MinLambda(Xmu = tas.post.samp$mu, mm = 120, nn = 98,
#                                  nGrid = 45, nLambda = 3, sphere = FALSE,
#                                  lambda=10^seq(-12, 10, len = 45))

## ----objectivefunc2, echo=FALSE, eval=TRUE-------------------------------
load(system.file("/extdata", "tas.min.lambda.out.Rda", package = "mrbsizeR"))

## ----objectivefunc3, echo=TRUE, eval=TRUE, results='markup'--------------
# Minimal smoothing parameter values
tas.min.lambda.out$lambda[tas.min.lambda.out$minind]

## ----objectivefunc4, echo=TRUE, eval=FALSE-------------------------------
#  # Plot of the minimization result
#  plot(x = tas.min.lambda.out)

## ----mrbsizer1, echo=TRUE, eval=FALSE------------------------------------
#  # Creation of differences of smooths at neighboring scales
#  tas.mrb.out <- mrbsizeRgrid(posteriorFile = tas.post.samp$sample, mm = 120, nn = 98,
#                              lambdaSmoother = c(0.1, 90, 15000), prob = 0.95)

## ----smoothmeanplot1, echo=TRUE, eval=FALSE------------------------------
#  # Posterior mean of the different detail components
#  plot(x = tas.mrb.out$smMean, color.pallet = fields::tim.colors(), turnOut = FALSE,
#       aspRatio = 98/120)

## ----pwmap1, echo=TRUE, eval=FALSE---------------------------------------
#  # Plot of pointwise (PW) maps
#  plot(x = tas.mrb.out$hpout, plot_which = "PW", aspRatio = 98/120,
#       color = c("dodgerblue3", "gainsboro", "firebrick1"), turnOut = FALSE)

## ----hpwmap1, echo=TRUE, eval=FALSE--------------------------------------
#  # Plot of highest pointwise probability (HPW) maps
#  plot(x = tas.mrb.out$hpout, plotWhich = "HPW", aspRatio = 98/120,
#       color = c("dodgerblue3", "gainsboro", "firebrick1"), turnOut = FALSE)

## ----cimap1, echo=TRUE, eval=FALSE---------------------------------------
#  # Plot of simultaneous credible interval (CI) maps
#  plot(x = tas.mrb.out$ciout, color = c("dodgerblue3", "gainsboro", "firebrick1"),
#       turnOut = FALSE, aspRatio = 98/120)

## ----spherical1, echo = FALSE, results = 'markup', fig.cap = '\\label{fig:spherical1}Deviation from mean of simulated air temperature measurements (CCSM4) for the years 1870--2100 in degrees Kelvin. The deviations are summarized by their mean.', fig.width=5, fig.height=3----
load(system.file("/extdata", "junedat_mu.Rda", package = "mrbsizeR"))
par(mar = c(1, 1, 3, 1))
image.plot(junedat_mu$lon, junedat_mu$lat, junedat_mu$junedat.mu, col = fields::tim.colors(), xaxt = "n", yaxt = "n",
      ylab = "", xlab = "", main ="Deviation of Mean from Surface Air Temperature (CCSM4)", cex.main = 0.8,
      legend.shrink = 0.6, axis.args = list(cex.axis = 0.6))
map("world", wrap = TRUE, add = TRUE)
box()


## ----spherical2, echo=TRUE, eval=FALSE-----------------------------------
#  # Minimization of objective function with respect to the smoothing parameters
#  # for spherical data
#  spherical.min.lambda.out <- MinLambda(Xmu = dat.ccsm4.mu, mm = 144, nn = 72,
#                                        nGrid = 35, nLambda = 2, sphere = TRUE)

## ----spherical4, echo=TRUE, eval=FALSE-----------------------------------
#  # Creation of differences of smooths at neighboring scales for spherical data
#  spherical.mrb.out <- mrbsizeRsphere(posteriorFile = dat.ccsm4, mm = 144, nn = 72,
#                                      prob = 0.95, lambdaSmoother = c(0.0026))

## ----spherical5, echo=TRUE, eval=FALSE-----------------------------------
#  # Posterior mean of the different detail components for spherical data
#  plot(x = spherical.mrb.out$smMean, lon = dat.ccsm4$lon, lat = dat.ccsm4$lat,
#       color.pallet = fields::tim.colors())
#  

## ----spherical6, echo=TRUE, eval=FALSE-----------------------------------
#  # Plot of highest pointwise probability (HPW) maps for spherical data
#  plot(x = spherical.mrb.out$hpout, lon = dat.ccsm4$lon, lat = dat.ccsm4$lat,
#       plotWhich = "HPW", color = c("dodgerblue3", "gainsboro", "firebrick1"))
#  

## ----increasesamples, echo=TRUE, eval=FALSE, results ='asis'-------------
#  # Generate samples from posterior distribution
#  tas.post.samp <- rmvtDCT(object = tas.su.1995.MM5I$su,
#                           lambda = 0.2, sigma = 36, nu0 = 15, ns = 1000)
#  
#  # Do mrbsizeR analysis and output the differences of smooths for all samples
#  tas.mrb.out.1 <- mrbsizeRgrid(posteriorFile = tas.post.samp$sample, mm = 120,
#                                nn = 98, lambdaSmoother = c(0.1, 90, 15000),
#                                prob = 0.95, smoothOut = TRUE)
#  
#  # Do the same procedure again
#  tas.post.samp <- rmvtDCT(object = tas.su.1995.MM5I$su,
#                           lambda = 0.2, sigma = 36, nu0 = 15, ns = 1000)
#  
#  tas.mrb.out.2 <- mrbsizeRgrid(posteriorFile = tas.post.samp$sample, mm = 120,
#                                nn = 98, lambdaSmoother = c(0.1, 90, 15000),
#                                prob = 0.95, smoothOut = TRUE)
#  
#  # Combine all differences-of-smooths-samples and call CImap manually
#  smoothSamples <- list(); ciout <- list()
#  
#  for(i in 1:length(tas.mrb.out.1$smoothSamples)) {
#    smoothSamples <- cbind(tas.mrb.out.1$smoothSamples[[i]],
#                           tas.mrb.out.2$smoothSamples[[i]])
#    ciout[[i]] <- CImap(smoothVec = smoothSamples, mm = 120, nn = 98, prob = 0.95)
#  }
#  
#  # Set the class correctly for visualizing the output.
#  # Titles need to be defined in this case!
#  # Class name CI maps: "CImapGrid" or "CImapSphere"
#  # Class name PW / HPW maps: "HPWmapGrid" or "HPWmapSphere"
#  class(ciout) <- "CImapGrid"
#  plot(ciout, title = c("Diff_1", "Diff_2", "Diff_3", "Diff_4", "Diff_5"))
#  

