## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(mtcars, 5), caption = "1974 Motor Trends Car Data")

## ---- collapse = T-------------------------------------------------------
library(prefeR)
p <- prefEl(data = mtcars)
p

## ------------------------------------------------------------------------
p$priors <- c(Exp(1),   # MPG
              Normal(), # Number of cylinders (Normal() = Normal(0, 1))
              Normal(), # displacement
              Exp(2),   # horsepower
              Normal(), # real axle ratio
              Normal(), # weight
              Exp(-3),  # quarter mile time
              Normal(), # Engine type
              Normal(), # transmission type
              Normal(), # number of gears
              Normal()  # number of carburetors
)

## ---- results='hide'-----------------------------------------------------
p$addPref("Pontiac Firebird" %>% "Fiat 128")  # prefer a cool sports car 
p$addPref("Mazda RX4 Wag" %<% "Mazda RX4")    # prefer not to have the station wagon
p$addPref("Merc 280" %=% "Merc 280C")         # indifferent about C-option

## ---- collapse = T-------------------------------------------------------
p

## ---- collapse = T-------------------------------------------------------
p$infer()

## ---- collapse = T-------------------------------------------------------
p$rank()[1:5]

## ---- collapse = T-------------------------------------------------------
p$suggest()

