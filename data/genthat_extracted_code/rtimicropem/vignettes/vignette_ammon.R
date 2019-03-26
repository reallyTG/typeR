## ---- echo = FALSE, warning=FALSE, message=FALSE-------------------------
library("knitr")
library("dplyr")

## ---- warning=FALSE, message=FALSE---------------------------------------
library("rtimicropem")
micropem_example <- convert_output(system.file("extdata", "CHAI.csv", package = "rtimicropem"))
class(micropem_example)
print(micropem_example)

## ---- fig.width=7, fig.height=7, warning=FALSE---------------------------
data("micropemChai")
micropemChai$plot()

## ----comment = NA, results = "asis", comment = NA, tidy = F, warning=FALSE, message=FALSE, eval = FALSE----
#  library("rbokeh")
#  p <- micropemChai$plot(type = "interactive")
#  p
#  

## ---- results="asis"-----------------------------------------------------
library("xtable")
data("micropemChai")
results <- micropemChai$summary()
results %>% knitr::kable()


