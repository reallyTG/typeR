## ----Library call, echo=FALSE--------------------------------------------
library(spind)
library(ggplot2)

knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----GEE Data Infiling, eval=FALSE---------------------------------------
#  data(musdata)
#  data(carlinadata)
#  
#  # Examine the structure to familiarize yourself with the data
#  ?musdata
#  head(musdata)
#  
#  ?carlinadata
#  head(carlinadata)
#  

## ----GEE Example, fig.width=7.15,fig.height=5----------------------------
# Next, fit a simple GEE and view the output
coords <- musdata[ ,4:5]

mgee <- GEE(musculus ~ pollution + exposure, family = "poisson", data = musdata,
            coord = coords, corstr = "fixed", scale.fix = FALSE)

summary(mgee, printAutoCorPars = TRUE)

plot(mgee)

predictions <- predict(mgee, newdata = musdata)

# you can modify the plot itself by extracting it from the plot object and
# treating it as any other ggplot object.

library(ggplot2)
my_plot <- mgee$plot

# more of a base-R graphic feel
my_plot + 
  theme(plot.background = element_rect(fill = NA,
                                       color = 'black',
                                       size = 1.25))



## ----WRM Example, fig.width = 7.15, fig.height = 5-----------------------


mwrm <- WRM(musculus ~ pollution + exposure, family = "poisson",
            data = musdata, coord = coords, level = 1)

plot(mwrm)

summary(mwrm)

predictions <- predict(mwrm, newdata = musdata)


## ----Covar.plot Example, fig.width = 7.15, fig.height = 5----------------

coords <- carlinadata[ ,4:5]

wave_covariance <- covar.plot(carlina.horrida ~ aridity + land.use - 1,
                              data = carlinadata, coord = coords, wavelet = "d4",
                              wtrafo = 'modwt', plot = 'covar')

wave_variance <- covar.plot(carlina.horrida ~ aridity + land.use - 1,
                            data = carlinadata, coord = coords, wavelet = "d4",
                            wtrafo = 'modwt', plot = 'var')

wave_variance$result
wave_covariance$result

# view plots side by side

library(gridExtra)
grid.arrange(wave_variance$plot, wave_covariance$plot)


## ----Upscale Example, fig.width = 7.15, fig.height = 7-------------------

upscale(carlinadata$land.use, coord = coords,
        pad = mean(carlinadata$land.use))



## ----Step.spind Example--------------------------------------------------

# For demonstration only. We are artificially imposing a grid structure
# on data that is not actually spatial data

library(MASS)
data(birthwt)


x <- rep(1:14, 14)
y <- as.integer(gl(14, 14))
coords <- cbind(x[-(190:196)], y[-(190:196)])

formula <- formula(low ~ age + lwt + race + smoke + ftv +  bwt + I(race^2))

mgee <- GEE(formula, family = "gaussian", data = birthwt,
            coord = coords, corstr = "fixed",scale.fix = TRUE)

mwrm <- WRM(formula, family = "gaussian", data = birthwt,
          coord = coords, level = 1)

ssgee <- step.spind(mgee, birthwt)
sswrm <- step.spind(mwrm, birthwt, AICc = TRUE)

best.mgee <- GEE(ssgee$model, family = "gaussian", data = birthwt,
                 coord = coords, corstr = "fixed",scale.fix = TRUE)

best.wrm <- WRM(sswrm$model, family = "gaussian", data = birthwt,
                coord = coords, level = 1)

summary(best.mgee, printAutoCorPars = FALSE)
summary(best.wrm)


## ----mmi... example------------------------------------------------------

# Example for WRMs
data(carlinadata)
coords <- carlinadata[ ,4:5]

wrm <- WRM(carlina.horrida ~ aridity + land.use, family = "poisson",
           data = carlinadata, coord = coords, level = 1, wavelet = "d4")

ms1 <- scaleWMRR(carlina.horrida ~ aridity + land.use, family = "poisson",
                 data = carlinadata, coord = coords, scale = 1,
                 wavelet = 'd4', trace = FALSE)

mmi <- mmiWMRR(wrm, data = carlinadata, scale = 1, detail = TRUE)

# Example for GEEs
library(MASS)
data(birthwt)

# impose an artificial (not fully appropriate) grid structure
x <- rep(1:14, 14)
y <- as.integer(gl(14, 14))
coords <- cbind(x[-(190:196)], y[-(190:196)])

formula <- formula(low ~ race + smoke +  bwt)

mgee <- GEE(formula, family = "gaussian", data = birthwt,
            coord = coords, corstr = "fixed", scale.fix = TRUE)

mmi <- mmiGEE(mgee, birthwt)



## ----RVI.plot Example, fig.width=7.15, fig.height=5----------------------
data(carlinadata)
coords <- carlinadata[ ,4:5]

rvi <- rvi.plot(carlina.horrida ~ aridity + land.use, family = "poisson",
                data = carlinadata, coord = coords, maxlevel = 4, 
                detail = TRUE, wavelet = "d4")

rvi$rvi
rvi$plot


## ----GOF data, eval = FALSE----------------------------------------------
#  data(hook)
#  
#  # Familiarize yourself with the data
#  ?hook
#  head(hook)
#  

## ----Spatial Indices Example, fig.width = 7.15, fig.height = 5-----------

df <- hook[ ,1:2]
coords <- hook[ ,3:4]

# Threshold dependent metrics
th.dep.indices <- th.dep(data = df, coord = coords, spatial = TRUE)

# Confusion Matrix
th.dep.indices$cm

# Kappa statistic
th.dep.indices$kappa

# Threshold independent metrics
th.indep.indices <- th.indep(data = df, coord = coords, 
                             spatial = TRUE)

# AUC
th.indep.indices$AUC

# TSS
th.indep.indices$TSS

# AUC plot
th.indep.indices$plot




## ----ACFFT example-------------------------------------------------------

coords <- musdata[ ,4:5]
mglm <- glm(musculus ~ pollution + exposure, family = "poisson",
            data = musdata)

ac <- acfft(coords, resid(mglm, type = "pearson"),
            lim1 = 0, lim2 = 1, dmax = 10)
ac


