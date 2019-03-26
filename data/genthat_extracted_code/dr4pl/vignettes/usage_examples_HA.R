## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.width = 7)

## ------------------------------------------------------------------------
library(drc)
library(dr4pl)
library(ggplot2)

## ------------------------------------------------------------------------
head(drc_error_1)
ggplot(drc_error_1, aes(x = Dose, y = Response)) +  # Data name, variable names
  geom_point() +  # Put data points on the scatter plot
  scale_x_log10() +  # Change the x-axis scale to log 10 scale
  ggtitle("Error Case 1")  # Set the title

## ------------------------------------------------------------------------
tryCatch({
  drm(Response~Dose, data = drc_error_1, fct = LL.4())
},
warning = function(war) {
  # warning handler picks up where error was generated
  print(paste(sep = " ", war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(sep = " ", err))
})

## ------------------------------------------------------------------------
dr4pl.error.1 <- dr4pl(Response~Dose, data = drc_error_1)

plot(dr4pl.error.1, text.title = "Error plot #1")

## ------------------------------------------------------------------------
dr4pl.error.1$convergence  # FALSE indicates convergence failure

## ------------------------------------------------------------------------
dr4pl.robust.1 <- dr4pl.error.1$dr4pl.robust
class(dr4pl.error.1)
class(dr4pl.robust.1)
dr4pl.robust.1$convergence

## ------------------------------------------------------------------------
plot(dr4pl.robust.1, indices.outlier = dr4pl.robust.1$idx.outlier)

## ------------------------------------------------------------------------
ggplot(drc_error_2, aes(x = Dose, y = Response)) +
  geom_point() +
  scale_x_log10() +
  ggtitle("Error Case 2")

## ------------------------------------------------------------------------
dr4pl.error.2 <- dr4pl(Response~Dose, data = drc_error_2, method.init = "logistic")
plot(dr4pl.error.2, text.title = "Trend is default")

## ------------------------------------------------------------------------
dr4pl.error.2 <- dr4pl(Response~Dose, data = drc_error_2, trend = "decreasing", method.init = "logistic", method.robust = "absolute")
plot(dr4pl.error.2, text.title = "Trend forced to decrease")

## ------------------------------------------------------------------------
ggplot(drc_error_4, aes(x = Dose, y = Response)) +
  geom_point() +
  scale_x_log10() +
  ggtitle("drc_error_4")

## ------------------------------------------------------------------------
tryCatch({
  drm(Response~Dose, data = drc_error_4, fct = LL.4())
},
warning = function(war) {
  # warning handler picks up where error was generated
  print(paste(sep = " ", war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(sep = " ", err))
})

## ------------------------------------------------------------------------
dr4pl.error.4 <- dr4pl(Response~Dose, data = drc_error_4, method.init = "logistic")
dr4pl.error.4$convergence
plot(dr4pl.error.4, text.title = "Error plot #4")

## ------------------------------------------------------------------------
dr4pl.Mead.5 <- dr4pl(Response~Dose, data = sample_data_5)
plot(dr4pl.Mead.5, text.title = "Fit with Mead's method")

## ------------------------------------------------------------------------
dr4pl.logistic.5 <- dr4pl(Response~Dose, data = sample_data_5, method.init = "logistic")
plot(dr4pl.logistic.5, text.title = "Fit with the logistic method")

## ------------------------------------------------------------------------
dr4pl.absolute.5 <- dr4pl(Response~Dose, data = sample_data_5, method.robust = "absolute")
plot(dr4pl.absolute.5, text.title = "Fit with the absolute loss")

dr4pl.Tukey.5 <- dr4pl(Response~Dose, data = sample_data_5, method.robust = "Tukey")
plot(dr4pl.Tukey.5, text.title = "Fit with Tukey's biweight loss")

## ------------------------------------------------------------------------
dr4pl.3 <- dr4pl(Response~Dose, data = sample_data_3)
plot(dr4pl.3, text.title = "Sample data #3")

## ------------------------------------------------------------------------
summary.dr4pl.3 <- summary(dr4pl.3)
summary.dr4pl.3$coefficients

## ------------------------------------------------------------------------
values <- IC(dr4pl.3, c(10, 30, 50, 70, 90))
values

## ----chickweed0----------------------------------------------------------
dr4pl.chickweed <- dr4pl(count~time, data = chickweed0, trend = "increasing")
plot(dr4pl.chickweed, text.x = "Time", text.y = "Count", text.title = "Dataset chickweed0", breaks.x = c(25, 100, 175, 250))

