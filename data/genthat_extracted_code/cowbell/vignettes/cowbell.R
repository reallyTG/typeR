## ---- echo = FALSE, out.width="600px"------------------------------------
knitr::include_graphics("RegressionModel.png")

## ---- echo = FALSE-------------------------------------------------------
library(cowbell)
concept<-generateCowbellConcept(Fun ~ Fluency * Absorption, 1, 9, 1, 7, 1, 7)
data(allFun)
test<-generateCowbell(concept, allFun)
summary(test)

## ---- echo = FALSE, out.width="400px"------------------------------------
knitr::include_graphics("Example.png")

