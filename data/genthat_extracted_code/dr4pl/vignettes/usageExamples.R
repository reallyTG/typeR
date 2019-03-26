## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.width = 7)

## ------------------------------------------------------------------------
library(drc)
library(dr4pl)
library(ggplot2)
library(matrixcalc)

## ------------------------------------------------------------------------
ggplot(drc_error_1, aes(x = Dose, y = Response)) +
  geom_point() +
  scale_x_log10() +
  ggtitle("drc_error_1")

## ------------------------------------------------------------------------
a <- tryCatch({
  drc::drm(Response~Dose, data = drc_error_1, fct = LL.4())
}, 
warning = function(war) {
  # warning handler picks up where error was generated
  print(paste(war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(err))
})

## ------------------------------------------------------------------------
a <-tryCatch({
  dr4pl(Response~Dose, data = drc_error_1, method.init = "logistic", method.robust = "Tukey")
},
warning = function(war) {
    # warning handler picks up where error was generated
    print(paste(war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(err))
})
plot(a, text.title = "Error plot #1")

## ------------------------------------------------------------------------
ggplot(drc_error_2, aes(x = Dose, y = Response)) +
  geom_point() +
  scale_x_log10() +
  ggtitle("drc_error_2")

## ------------------------------------------------------------------------
a <- tryCatch({
  drc::drm(Response~Dose, data = drc_error_2, fct = LL.4())
}, 
warning = function(war) {
  # warning handler picks up where error was generated
  print(paste(war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(err))
})

## ------------------------------------------------------------------------
a <-tryCatch({
  dr4pl(Response~Dose, data = drc_error_2, trend = "decreasing", method.optim = "CG")
},
warning = function(war) {
    # warning handler picks up where error was generated
    print(paste(war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(err))
})
b <- plot(a, breaks.x = c(0.00135, 0.0135, 0.135, 1.35, 13.5), text.title = "Error plot #2")
b

## ------------------------------------------------------------------------
ggplot(drc_error_3, aes(x = Dose, y = Response)) +
  geom_point() +
  scale_x_log10() +
  ggtitle("drc_error_3")

## ------------------------------------------------------------------------
a <- tryCatch({
  drc::drm(Response~Dose, data = drc_error_3, fct = LL.4())
}, 
warning = function(war) {
  # warning handler picks up where error was generated
  print(paste(war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(err))
})


## ------------------------------------------------------------------------
a <-tryCatch({
  dr4pl(Response~Dose, data = drc_error_3, method.init = "Mead", method.robust = "Huber")
},
warning = function(war) {
    # warning handler picks up where error was generated
    print(paste(war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(err))
})
plot(a, text.title = "Error plot #3")

## ------------------------------------------------------------------------
ggplot(drc_error_4, aes(x = Dose, y = Response)) +
  geom_point() +
  scale_x_log10() +
  ggtitle("drc_error_4")

## ------------------------------------------------------------------------
a <- tryCatch({
  drc::drm(Response~Dose, data = drc_error_4, fct = LL.4())
}, 
warning = function(war) {
  # warning handler picks up where error was generated
  print(paste(war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(err))
})

## ------------------------------------------------------------------------
a <-tryCatch({
  dr4pl(Response~Dose, data = drc_error_4, method.init = "logistic")
},
warning = function(war) {
    # warning handler picks up where error was generated
    print(paste(war))
},
error = function(err) {
  # error handler picks up where error was generated
  print(paste(err))
})
plot(a, text.title = "Error plot #4")

## ------------------------------------------------------------------------
a <- dr4pl(Response~Dose, data = sample_data_5)
plot(a, text.title = "Default Sample data #5")

## ------------------------------------------------------------------------
a <- dr4pl(Response~Dose, data = sample_data_5, method.init = "logistic")
plot(a, text.title = "Logistic Method")

## ------------------------------------------------------------------------
a <- dr4pl(Response~Dose, data = sample_data_5, method.robust = "absolute")
plot(a, text.title = "Absolute loss function")

## ------------------------------------------------------------------------
a <- dr4pl(Response~Dose, data = sample_data_5, method.init = "Mead", method.robust = "Tukey")
plot(a, text.title = "Mead's method & Tukey's biweight")

## ------------------------------------------------------------------------
a <- dr4pl(Response~Dose, data = sample_data_3, method.init = "Mead")
b <- plot(a, text.title = "Sample data #3")
b

## ------------------------------------------------------------------------
b <- summary(a)
b$coefficients

## ------------------------------------------------------------------------
values <- IC(a, c(10, 30, 50, 70, 90))
values

## ----chickweed0----------------------------------------------------------
a <- dr4pl(count~time, data = chickweed0, trend = "increasing")
plot(a, text.x = "Time", text.y = "Count", text.title = "drc chickweed0 plot", breaks.x = c(25, 100, 175, 250))

## ------------------------------------------------------------------------
a <- dr4pl(Response~Dose, data = drc_error_2)
plot(a, text.title = "Trend is default")

## ------------------------------------------------------------------------
a <- dr4pl(Response~Dose, data = drc_error_2, trend = "decreasing", method.optim = "CG")
plot(a, text.title = "Trend forced to decrease")

## ------------------------------------------------------------------------
a <- dr4pl(Response~Dose, data = drc_error_2, trend = "increasing", method.robust = "Tukey", method.optim = "SANN")
plot(a, text.title = "Trend forced to increase")

