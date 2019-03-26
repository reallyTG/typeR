## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(include = TRUE, echo = TRUE, eval = TRUE, message = FALSE, warning = FALSE, 
                      out.width = "100%", fig.align = "center", 
                      cache = T, fig.asp = 0.75, fig.width = 9)

## ------------------------------------------------------------------------
library(metaviz)

## ---- echo = FALSE-------------------------------------------------------
set.seed(2)

## ---- message = TRUE, dpi = 300------------------------------------------
funnelinf(homeopath[, c("d", "se")])

## ------------------------------------------------------------------------
nullabor::decrypt("EwkU v7d7 9S YTV9d9TS Wo")

## ---- dpi = 300----------------------------------------------------------
# set.seed(2)
# funnelinf(homeopath[, c("d", "se")])

set.seed(2) # same random seed as used above
funnelinf(homeopath[, c("d", "se")], 
          show_solution = TRUE)

## ---- echo = FALSE-------------------------------------------------------
set.seed(3)

## ---- dpi = 300----------------------------------------------------------
funnelinf(homeopath[, c("d", "se")], 
          n = 4)

## ------------------------------------------------------------------------
nullabor::decrypt("EwkU v7d7 9S YTV9d9TS Wu")

## ---- echo = FALSE-------------------------------------------------------
set.seed(4)

## ---- dpi = 300----------------------------------------------------------
funnelinf(homeopath[, c("d", "se")], n = 4, 
          null_model = "FEM")

## ------------------------------------------------------------------------
nullabor::decrypt("EwkU v7d7 9S YTV9d9TS WW")

## ---- dpi = 300----------------------------------------------------------
funnelinf(homeopath[, c("d", "se")], n = 4, null_model = "FEM", 
          rorschach = TRUE)

## ---- echo = FALSE-------------------------------------------------------
set.seed(4)

## ---- dpi = 300----------------------------------------------------------
funnelinf(homeopath[, c("d", "se")], n = 4, 
          y_axis = "precision")

## ---- echo = FALSE-------------------------------------------------------
set.seed(4)

## ---- dpi = 300----------------------------------------------------------
funnelinf(homeopath[, c("d", "se")], n = 4, 
          egger = TRUE, 
          trim_and_fill = TRUE, 
          trim_and_fill_side = "right")

## ------------------------------------------------------------------------
age <- factor(homeopath$year > 2000, levels = c(FALSE, TRUE), labels = c("old", "new"))

## ------------------------------------------------------------------------
set.seed(4)

## ---- dpi = 300----------------------------------------------------------
funnelinf(homeopath[, c("d", "se")], n = 4, null_model = "FEM", 
          group = age)

