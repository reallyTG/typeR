## ---- include = FALSE----------------------------------------------------
is_check <- ("CheckExEnv" %in% search()) || any(c("_R_CHECK_TIMINGS_",
             "_R_CHECK_LICENSE_") %in% names(Sys.getenv()))
knitr::opts_chunk$set(eval = !is_check)

## ------------------------------------------------------------------------
Sys.sleep(100)

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
    comment = NA,
    quiet = TRUE,
    progress = FALSE,
    tidy = FALSE,
    cache = FALSE,
    message = FALSE,
    error = FALSE, # FALSE: always stop execution.
    warning = TRUE,
    dpi = 100
)

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_knit$set(global.par = TRUE)

## ---- echo = FALSE-------------------------------------------------------
par(mar = c(3, 3, 2, 2), mgp = c(1.7, 0.5, 0), las = 1, cex.main = 1, tcl = -0.2, cex.axis = 0.8,
    cex.lab = 0.8)

## ---- fig.width = 5, fig.height = 6--------------------------------------
# load packages
library(sp)
library(spup)
library(GGally)
library(gridExtra)
library(purrr)
library(magrittr)

# source code for Slope model
source("examples/Slope.R")

# set seed
set.seed(12345)

# load and view the data
data(dem30m, dem30m_sd)
str(dem30m)
str(dem30m_sd)
grid.arrange(spplot(dem30m, main = list(label = "Mean DEM [m]", cex = 1)),
             spplot(dem30m_sd, main = list(label = "DEM sd [m]", cex = 1)))

## ------------------------------------------------------------------------
# define spatial correlogram model
dem_crm <- makeCRM(acf0 = 0.8, range = 300, model = "Exp")

## ---- fig.width = 5, fig.height = 3--------------------------------------
plot(dem_crm, main = "DEM correlogram")

## ---- fig.width = 7, fig.height = 5--------------------------------------
par(mfrow = c(2, 2))
crm <- makeCRM(acf0 = 0.8, range = 700, model = "Sph") 
plot(crm, main = "'Spherical', acf0 = 0.8, range = 700")
crm <- makeCRM(acf0 = 0.2, range = 700, model = "Sph") 
plot(crm, main = "'Spherical', acf0 = 0.2, range = 700")
crm <- makeCRM(acf0 = 0.8, range = 700, model = "Lin") 
plot(crm, main = "'Linear', acf0 = 1.0, range = 700")
crm <- makeCRM(acf0 = 0.8, range = 200, model = "Gau") 
plot(crm, main = "'Gaussian', acf0 = 0.8, range = 200")

## ------------------------------------------------------------------------
# define uncertainty model for the DEM
demUM <- defineUM(uncertain = TRUE, distribution = "norm", 
                   distr_param = c(dem30m, dem30m_sd), crm = dem_crm)
class(demUM)

## ---- fig.width = 7, fig.height = 7--------------------------------------
# create realizations of the DEM
dem_sample <- genSample(UMobject = demUM, n = 100, samplemethod = "ugs", nmax = 20, asList = FALSE)

# view several realizations of DEM
spplot(dem_sample[c(5,6,3,4,1,2)], main = list(label = "Examples of the DEM realizations", cex = 1))

## ---- fig.width = 5, fig.height = 6--------------------------------------
# compute and plot the slope sample statistics
# e.g. mean and standard deviation
dem_sample_mean <- mean_MC_sgdf(dem_sample)
dem_sample_sd <- sd_MC_sgdf(dem_sample)
grid.arrange(spplot(dem_sample_mean, main = list(label = "Mean of the DEM realizations", cex = 1)),
             spplot(dem_sample_sd, main = list(label = "Standard dev. of the DEM realizations", cex = 1)))

## ---- fig.width = 5, fig.height = 6--------------------------------------
dem_crm2 <- makeCRM(acf0 = 0.2, range = 300, model = "Exp")
demUM2 <- defineUM(uncertain = TRUE, distribution = "norm", distr_param = c(dem30m, dem30m_sd), crm = dem_crm2)
dem_sample2 <- genSample(UMobject = demUM2, n = 100, samplemethod = "ugs", nmax = 20, asList = FALSE,
                         debug.level = -1)
grid.arrange(spplot(dem_sample, c(1), main = list(label = "dem_sample, acf0 = 0.8, range = 300m", cex = 1)),
             spplot(dem_sample2, c(1), main = list(label = "dem_sample2, acf0 = 0.2, range = 300m", cex = 1)))

## ------------------------------------------------------------------------
# view the model
Slope

## ------------------------------------------------------------------------
# coerce  SpatialGridDataFrame to a list of individual SpatialGridDataFrames
dem_sample <- map(1:ncol(dem_sample), function(x){dem_sample[x]})

# or sample from uncertain input and save it in a list
dem_sample <- genSample(UMobject = demUM, n = 100, samplemethod = "ugs", nmax = 20, asList = TRUE,
                        debug.level = -1)

## ------------------------------------------------------------------------
# run uncertainty propagation
slope_sample <- propagate(dem_sample, model = Slope, n = 100)

## ---- fig.width = 7, fig.height = 7--------------------------------------
# coerce slopes list to a SpatialGridDataFrame
s <- slope_sample[[1]]
for (i in 2:length(slope_sample)) {
  s@data[i] <- slope_sample[[i]]@data
}
names(s@data) <- paste("slope", c(1:ncol(s)), sep = "")
slope_sample <- s
rm(s)

# view the sample of the model output
spplot(slope_sample[c(5,6,3,4,1,2)], main = list(label = "Examples of the slope realizations", cex = 1))

## ---- fig.width = 5, fig.height = 6--------------------------------------
# compute and plot slope sample statistics
# e.g. mean and standard deviation
slope_mean <- mean_MC_sgdf(slope_sample)
summary(slope_mean)
slope_sd <- sd_MC_sgdf(slope_sample, na.rm = TRUE) # na.rm = TRUE is necessary, because slope cannot be calculated at the border
grid.arrange(spplot(slope_mean, main = list(label = "Mean of the slope realizations [deg]", cex = 1)),
             spplot(slope_sd, main = list(label = "Standard dev. of the slope realizations [deg]", cex = 1)))

## ---- fig.width = 5, fig.height = 3--------------------------------------
# select a couple of locations and plot points on the slope map
loc1 <- 2200  # the numbers correspond to rows number in SpatialGridDataFrame 'dem30m'
loc2 <- 6200  # with an example location of high and low DEM sd
points <- data.frame(t(coordinates(slope_sample)[loc1,]))
points[2,] <- t(coordinates(slope_sample)[loc2,])
coordinates(points) <- ~ s1 + s2
proj4string(points) <- proj4string(slope_sample)
spplot(slope_sample, c(1), col.regions = grey.colors(16),
       sp.layout = c('sp.points', points, col = "red", pch = 19, cex = 1.2))

## ---- fig.width = 7, fig.height = 3--------------------------------------
l_mean <- mean(as.numeric(slope_sample@data[loc1,]))
l_sd <- sd(as.numeric(slope_sample@data[loc1,]))
h_mean <- mean(as.numeric(slope_sample@data[loc2,]))
h_sd <- sd(as.numeric(slope_sample@data[loc2,]))

par(mfrow = c(1,2))
hist(as.numeric(slope_sample@data[loc1,]), main = paste("Slope at high DEM sd,", "\n",
     "mean = ", round(l_mean, 2), ", sd = ", round(l_sd, 2), sep = ""), xlab = "Slope")
hist(as.numeric(slope_sample@data[loc2,]), main = paste("Slope at low DEM sd,", "\n",
     "mean = ", round(h_mean, 2), ", sd = ", round(h_sd, 2), sep = ""), xlab = "Slope")

## ---- fig.width = 5, fig.height = 5--------------------------------------
# scatter plot of slope against elevation
slope1 <- Slope(dem30m)
names(slope1@grid@ cellcentre.offset) <- c("x", "y")
df <- cbind(dem30m_sd@data, slope1@data)
ggscatmat(data = df, alpha=0.15)

## ---- fig.width = 7, fig.height = 5--------------------------------------
# or quantiles
slope_q <- quantile_MC_sgdf(slope_sample, probs = c(0.1, 0.25, 0.75, 0.9), na.rm = TRUE)
spplot(slope_q[c(3,4,1,2)], mail = list(label = "Quantiles of slope realizations", cex = 1))

## ---- fig.width = 5, fig.height = 3--------------------------------------
# identify areas of slope > 10 deg with 90% certainty.
slope_q$skiing <- NA
slope_q$skiing <- ifelse(slope_q$prob10perc > 5, ">90%certain", "<90%certain")
slope_q$skiing <- as.factor(slope_q$skiing)
spplot(slope_q, "skiing", col.regions = c("red","green"), main = "Areas suitable for skiing")

## ---- fig.width = 5, fig.height = 3--------------------------------------
# identify areas of elevation > 1000m and overlay with the slope map above
dem30m$Elev1000 <- NA
dem30m$Elev1000[dem30m$Elevation > 1000] <- "snow"
dem30m$Elev1000[is.na(dem30m$Elev1000)] <- "no snow"
dem30m$Elev1000 <- as.factor(dem30m$Elev1000)

snow <- dem30m[2]
snow_poly <- as(as(snow, "SpatialPixelsDataFrame"), "SpatialPolygonsDataFrame")
snow_poly <- aggregate(snow_poly, by = "Elev1000")

transparent_grey <- rgb(0,0,0, alpha = 0.35)
spl <- list("sp.grid", slope_q[5], col = c("red","green"))
spplot(snow_poly, col.regions = c(transparent_grey, "transparent"),  
       main = paste("Sufficiently certain that suitable", "\n", "for skiing and snow presence") ,
       sp.layout = spl)

