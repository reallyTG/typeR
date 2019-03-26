## ---- echo = FALSE-------------------------------------------------------
options(digits = 3)
knitr::opts_chunk$set(echo = TRUE, fig.width = 7.5, fig.height = 7.5, dpi = 100, out.width = "600px", fig.align='center', message = FALSE)

## ---- echo = F, message = F, results = 'hide'----------------------------
library(FFTrees)

## ---- eval = FALSE-------------------------------------------------------
#  # Install the package from CRAN
#  install.packages("FFTrees")

## ---- eval = TRUE, message = TRUE----------------------------------------
# Load the package
library(FFTrees)

## ---- eval = FALSE-------------------------------------------------------
#  # Open the main package guide
#  FFTrees.guide()

## ---- message = FALSE----------------------------------------------------
# Create an FFTrees object

heart.fft <- FFTrees(formula = diagnosis ~ .,           # Criterion and (all) predictors
                     data = heart.train,                # Training data
                     data.test = heart.test,            # Testing data
                     main = "Heart Disease",            # General label
                     decision.labels = c("Low-Risk", "High-Risk"))  # Labels for decisions

## ------------------------------------------------------------------------
heart.fft   # Print the object

## ------------------------------------------------------------------------
# Pring summary statistics of all trees
summary(heart.fft)

## ----fig.align = "center", out.width="50%", echo = FALSE, fig.cap = "Confusion table illustrating frequencies of 4 possible outcomes."----
knitr::include_graphics("../inst/confusiontable.jpg")

## ---- fig.width = 6.5, fig.height = 6------------------------------------
# Plot the best FFT when applied to the test data

plot(heart.fft,              # An FFTrees object
     data = "test")          # Which data to plot? "train" or "test"

## ---- fig.width = 10, fig.height = 6-------------------------------------
# Plot only the tree without accuracy statistics
plot(heart.fft, 
     stats = FALSE)

## ------------------------------------------------------------------------
# Show marginal cue accuracies in ROC space
plot(heart.fft, 
     what = "cues")

## ------------------------------------------------------------------------
# Show the names of all of the outputs in heart.fft

names(heart.fft)

## ---- eval = FALSE-------------------------------------------------------
#  # Predict classifications for a new dataset
#  predict(heart.fft,
#          data = heartdisease)

## ------------------------------------------------------------------------
# Create an FFT manuly
my.heart.fft <- FFTrees(formula = diagnosis ~.,
                        data = heart.train,
                        data.test = heart.test,
                        main = "My custom Heart Disease FFT",
                        my.tree = "If chol > 350, predict True. 
                                   If cp != {a}, predict False. 
                                   If age <= 35, predict False. Otherwise, predict True")

## ---- fig.width = 6.5, fig.height = 6------------------------------------
plot(my.heart.fft)

## ---- eval = FALSE-------------------------------------------------------
#  # Create an FFForest object (can take a few minutes)
#  heart.fff <- FFForest(formula = diagnosis ~.,
#                        data = heartdisease,
#                        ntree = 10,
#                        train.p = .5)

## ---- fig.width = 10, fig.height = 7, out.width = "600px"----------------
plot(heart.fff)

