## ---- echo = F, message = F, results = 'hide'----------------------------
library(FFTrees)

## ----fig.align = "center", out.width="75%", echo = FALSE-----------------
knitr::include_graphics("../inst/titanic.jpg")

## ------------------------------------------------------------------------
head(titanic)

## ---- message = FALSE, results = 'hide'----------------------------------
# Create fast-and-frugal trees from the titanic data

titanic.fft <- FFTrees(formula = survived ~.,
                       data = titanic,
                       main = "Titanic", 
                       decision.labels = c("Died", "Survived"))       

## ----fig.width = 6, fig.height = 6.5, fig.align = 'center', out.width = "80%"----
plot(titanic.fft,
     what = 'cues')

## ---- fig.width = 6, fig.height = 6.5, fig.align = 'center'--------------
plot(titanic.fft)

## ---- fig.align = 'center', fig.height = 6, fig.width = 9, out.width = "70%"----
# Show the best training titanic fast-and-frugal tree without statistics
plot(titanic.fft,
     stats = FALSE)

## ---- fig.align = 'center', fig.height = 9, fig.width = 11, out.width = "70%"----
plot(titanic.fft,
     show.icons = FALSE,     # Turn off icons
     show.iconguide = FALSE, # Turn off icon guide
     show.header = FALSE     # Turn off header
     )

## ---- message = FALSE, results = 'hide'----------------------------------
set.seed(100) # For replicability of the training/test split
titanic.pred.fft <- FFTrees(formula = survived ~.,
                            data = titanic,
                            main = "Titanic", 
                            decision.labels = c("Died", "Survived"),
                            train.p = .5)

## ---- fig.width = 6, fig.height = 6.5, fig.align='center'----------------
plot(titanic.pred.fft,
     tree = "best.train")

## ---- fig.width = 6, fig.height = 6.5, fig.align='center'----------------
plot(titanic.pred.fft,
     tree = "best.train",
     data = "test")

## ---- fig.width = 6, fig.height = 6.5, fig.align='center'----------------
plot(titanic.pred.fft,
     tree = 4,
     data = "test")

