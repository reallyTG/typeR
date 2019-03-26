## ---- echo = F, message = FALSE, results = 'hide'------------------------
library(FFTrees)
options(digits = 3)
knitr::opts_chunk$set(echo = TRUE, fig.width = 7.5, fig.height = 7.5, dpi = 100, out.width = "600px", fig.align='center', message = FALSE)

## ----fig.align = "center", out.width="250px", echo = FALSE---------------
knitr::include_graphics("../inst/mushrooms.jpg")

## ------------------------------------------------------------------------
head(mushrooms)

## ---- message = FALSE, results = 'hide', warning=FALSE-------------------
# Create FFTs from the mushrooms data

set.seed(100) # For replicability of the training / test data split

mushrooms.fft <- FFTrees(formula = poisonous ~.,
                         data = mushrooms,
                         train.p = .5,      # Split data into 50\50 training \ test
                         main = "Mushrooms",
                         decision.labels = c("Safe", "Poison"))   

## ------------------------------------------------------------------------
# Print information about the best performing tree
mushrooms.fft

## ------------------------------------------------------------------------
# Show mushrooms cue accuracies
plot(mushrooms.fft,
     what = "cues")

## ------------------------------------------------------------------------
# Plot the best FFT for the mushrooms data
plot(mushrooms.fft, 
     data = "test")

## ---- message = FALSE, results = 'hide', warning = FALSE-----------------
# Create trees using only ringtype and ringnum

mushrooms.ring.fft <- FFTrees(formula = poisonous ~ ringtype + ringnum,
                              data = mushrooms,
                              train.p = .5,
                              main = "Mushrooms (Ring Only)",
                              decision.labels = c("Safe", "Poison"))

## ------------------------------------------------------------------------
plot(mushrooms.ring.fft, 
     data = "test")

## ----fig.align = "center", out.width="250px", echo = FALSE---------------
knitr::include_graphics("../inst/virginica.jpg")

## ---- message = FALSE, results = 'hide'----------------------------------
iris.fft <- FFTrees(formula = virginica ~.,
                    data = iris.v,
                    main = "Iris",
                    decision.labels = c("Not-V", "V"))

## ------------------------------------------------------------------------
plot(iris.fft, 
     what = "cues")

## ------------------------------------------------------------------------
plot(iris.fft)

## ------------------------------------------------------------------------
plot(iris.fft,
     tree = 2)     # Show tree #2

