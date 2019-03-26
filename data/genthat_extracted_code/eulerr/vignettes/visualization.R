## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----colorexamle, fig.cap = "The eight first colors of the default color palette"----
set.seed(2)
library(eulerr)
con <- c(A = 1, B = 1, C = 1, D = 1, E = 1, F = 1, G = 1, H = 1,
         "A&B" = 0.2, "B&C" = 0.2, "C&D" = 0.2, "D&E" = 0.2, "E&F" = 0.2,
         "F&G" = 0.2, "G&H" = 0.2)
plot(euler(con), labels = as.character(1:8))

