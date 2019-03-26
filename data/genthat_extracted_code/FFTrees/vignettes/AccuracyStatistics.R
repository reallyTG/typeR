## ---- echo = FALSE-------------------------------------------------------
options(digits = 3)
knitr::opts_chunk$set(echo = TRUE, fig.width = 7.5, fig.height = 7.5, dpi = 100, out.width = "600px", fig.align='center', message = FALSE)

## ---- echo = F, message = F, results = 'hide'----------------------------
library(FFTrees)

## ------------------------------------------------------------------------
# Create an FFTrees object predicting heart disease
heart.fft <- FFTrees(formula = diagnosis ~.,
                     data = heartdisease)

plot(heart.fft)

## ----fig.align = "center", out.width="50%", echo = FALSE, fig.cap = "Confusion table illustrating frequencies of 4 possible outcomes."----
knitr::include_graphics("../inst/confusiontable.jpg")

## ------------------------------------------------------------------------
heart.fft

## ------------------------------------------------------------------------
# A vector of nodes at which each case was classified in FFT #1
heart.fft$levelout$train[,1]

## ------------------------------------------------------------------------
# Calculate the mean (this is mcu)
mean(heart.fft$levelout$train[,1])

## ------------------------------------------------------------------------
# Calculate pci (percent cues ignored) directly:
# (N.Cues - mcu) / (N.Cues)

(ncol(heartdisease) - heart.fft$tree.stats$train$mcu[1]) / ncol(heartdisease)

