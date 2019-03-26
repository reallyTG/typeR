## ---- echo = F, message = FALSE, results = 'hide'------------------------
library(FFTrees)

## ----fig1, fig.width = 6.5, fig.height = 6, echo = TRUE, fig.align='center', echo = TRUE, message = FALSE, fig.cap="A fast-and-frugal tree (FFT) to predict heart disease status"----
# Create a fast-and-frugal tree (FFT) predicting heart disease
heart.fft <- FFTrees(formula = diagnosis ~.,
                     data = heart.train,
                     data.test = heart.test,
                     main = "Heart Disease",
                     decision.labels = c("Healthy", "Diseased"))

# Visualize the best training tree applied to the test data
plot(heart.fft, data = "test")

## ---- eval = FALSE-------------------------------------------------------
#  @article{phillips2017FFTrees,
#   title = {FFTrees: A toolbox to create, visualize, and evaluate fast-and-frugal decision trees},
#   author = {Phillips, Nathaniel D and Neth, Hansjoerg and Woike, Jan K and Gaissmaier, Wolfgang},
#   year = 2017,
#   journal = {Judgment and Decision Making},
#   volume = 12,
#   number = 4,
#   pages = {344--368}
#  }

## ----fig.align = "center", out.width="50%", echo = FALSE-----------------
knitr::include_graphics("../inst/FFTrees_Logo.jpg")

