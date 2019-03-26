library(fitdistrplus)


### Name: graphcomp
### Title: Graphical comparison of multiple fitted distributions (for
###   non-censored data)
### Aliases: graphcomp cdfcomp denscomp qqcomp ppcomp
### Keywords: distribution

### ** Examples

# (1) Plot various distributions fitted to serving size data
#
data(groundbeef)
serving <- groundbeef$serving
fitW <- fitdist(serving, "weibull")
fitln <- fitdist(serving, "lnorm")
fitg <- fitdist(serving, "gamma")

cdfcomp(list(fitW, fitln, fitg), horizontals = FALSE)
cdfcomp(list(fitW, fitln, fitg), horizontals = TRUE)
cdfcomp(list(fitW, fitln, fitg), horizontals = TRUE, verticals = TRUE, datacol = "purple")
cdfcomp(list(fitW, fitln, fitg), legendtext = c("Weibull", "lognormal", "gamma"),
  main = "ground beef fits", xlab = "serving sizes (g)",
  ylab = "F", xlim = c(0, 250), xlegend = "center", lines01 = TRUE)
denscomp(list(fitW, fitln, fitg), legendtext = c("Weibull", "lognormal", "gamma"),
  main = "ground beef fits", xlab = "serving sizes (g)", xlim = c(0, 250), xlegend = "topright")
ppcomp(list(fitW, fitln, fitg), legendtext = c("Weibull", "lognormal", "gamma"),
  main = "ground beef fits", xlegend = "bottomright", line01 = TRUE)
qqcomp(list(fitW, fitln, fitg), legendtext = c("Weibull", "lognormal", "gamma"),
  main = "ground beef fits", xlegend = "bottomright", line01 = TRUE,
  xlim = c(0, 300), ylim = c(0, 300), fitpch = 16)


# (2) Plot lognormal distributions fitted by 
# maximum goodness-of-fit estimation
# using various distances (data plotted in log scale)
#
data(endosulfan)
ATV <- subset(endosulfan, group == "NonArthroInvert")$ATV
flnMGEKS <- fitdist(ATV, "lnorm", method = "mge", gof = "KS")
flnMGEAD <- fitdist(ATV, "lnorm", method = "mge", gof = "AD")
flnMGEADL <- fitdist(ATV, "lnorm", method = "mge", gof = "ADL")
flnMGEAD2L <- fitdist(ATV, "lnorm", method = "mge", gof = "AD2L")

cdfcomp(list(flnMGEKS, flnMGEAD, flnMGEADL, flnMGEAD2L),
  xlogscale = TRUE, main = "fits of a lognormal dist. using various GOF dist.",
  legendtext = c("MGE KS", "MGE AD", "MGE ADL", "MGE AD2L"),
  verticals = TRUE, xlim = c(10, 100000))
qqcomp(list(flnMGEKS, flnMGEAD, flnMGEADL, flnMGEAD2L),
  main = "fits of a lognormal dist. using various GOF dist.",
  legendtext = c("MGE KS", "MGE AD", "MGE ADL", "MGE AD2L"),
  xlogscale = TRUE, ylogscale = TRUE)
ppcomp(list(flnMGEKS, flnMGEAD, flnMGEADL, flnMGEAD2L),
  main = "fits of a lognormal dist. using various GOF dist.",
  legendtext = c("MGE KS", "MGE AD", "MGE ADL", "MGE AD2L"))


# (3) Plot normal and logistic distributions fitted by 
# maximum likelihood estimation
# using various plotting positions in cdf plots
#
data(endosulfan)
log10ATV <-log10(subset(endosulfan, group == "NonArthroInvert")$ATV)
fln <- fitdist(log10ATV, "norm")
fll <- fitdist(log10ATV, "logis")

# default plot using Hazen plotting position: (1:n - 0.5)/n
cdfcomp(list(fln, fll), legendtext = c("normal", "logistic"), xlab = "log10ATV")

# plot using mean plotting position (named also Gumbel plotting position)
# (1:n)/(n + 1)
cdfcomp(list(fln, fll),legendtext = c("normal", "logistic"), xlab = "log10ATV",
  use.ppoints = TRUE, a.ppoints = 0)
    
# plot using basic plotting position: (1:n)/n
cdfcomp(list(fln, fll),legendtext = c("normal", "logistic"), xlab = "log10ATV",
  use.ppoints = FALSE)


# (4) Comparison of fits of two distributions fitted to discrete data
#
data(toxocara)
number <- toxocara$number
fitp <- fitdist(number, "pois")
fitnb <- fitdist(number, "nbinom")
cdfcomp(list(fitp, fitnb), legendtext = c("Poisson", "negative binomial"))
denscomp(list(fitp, fitnb),demp = TRUE, legendtext = c("Poisson", "negative binomial"))
denscomp(list(fitp, fitnb),demp = TRUE, fittype = "l", dempcol = "black",
        legendtext = c("Poisson", "negative binomial"))
denscomp(list(fitp, fitnb),demp = TRUE, fittype = "p", dempcol = "black",
        legendtext = c("Poisson", "negative binomial"))
denscomp(list(fitp, fitnb),demp = TRUE, fittype = "o", dempcol = "black",
        legendtext = c("Poisson", "negative binomial"))


# (5) Customizing of graphical output and use of ggplot2
#
data(groundbeef)
serving <- groundbeef$serving
fitW <- fitdist(serving, "weibull")
fitln <- fitdist(serving, "lnorm")
fitg <- fitdist(serving, "gamma")
if (requireNamespace ("ggplot2", quietly = TRUE)) {
denscomp(list(fitW, fitln, fitg), plotstyle = "ggplot")
cdfcomp(list(fitW, fitln, fitg), plotstyle = "ggplot")
qqcomp(list(fitW, fitln, fitg), plotstyle = "ggplot")
ppcomp(list(fitW, fitln, fitg), plotstyle = "ggplot")
}

# customizing graphical output with graphics
denscomp(list(fitW, fitln, fitg), legendtext = c("Weibull", "lognormal", "gamma"),
  main = "ground beef fits", xlab = "serving sizes (g)", xlim = c(0, 250),
  xlegend = "topright", addlegend = FALSE)

# customizing graphical output with ggplot2
if (requireNamespace ("ggplot2", quietly = TRUE)) {
  dcomp <- denscomp(list(fitW, fitln, fitg), legendtext = c("Weibull", "lognormal", "gamma"),
    xlab = "serving sizes (g)", xlim = c(0, 250),
    xlegend = "topright", plotstyle = "ggplot", breaks = 20, addlegend = FALSE)
  dcomp + ggplot2::theme_minimal() + ggplot2::ggtitle("Ground beef fits")
}




