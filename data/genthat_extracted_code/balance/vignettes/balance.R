## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  library(devtools)
#  devtools::install_github("tpq/balance")
#  library(balance)
#  ?balance

## ---- echo = FALSE-------------------------------------------------------
library(balance)

## ----example-------------------------------------------------------------
data(expenditures, package = "robCompositions")
y1 <- data.frame(c(1, 1, 1, -1, -1), c(1, -1, -1, 0, 0),
                 c(0, +1, -1, 0, 0), c(0, 0, 0, +1, -1))
colnames(y1) <- paste0("z", 1:4)

## ---- fig.width = 7, fig.height = 5--------------------------------------
res <- balance.plot(expenditures, y1, size.text = 8)

## ---- fig.width = 7, fig.height = 5--------------------------------------
res <- balance.plot(expenditures, y1, d.group = c("A", "B", "A", "B", "C"), size.text = 8)

## ---- fig.width = 7, fig.height = 5--------------------------------------
res <- balance.plot(expenditures, y1, n.group = c(rep("A", 10), rep("B", 10)), size.text = 8)

## ---- fig.width = 7, fig.height = 5--------------------------------------
res <- balance.plot(expenditures, y1,
                    d.group = c("A", "B", "A", "B", "C"),
                    n.group = c(rep("A", 10), rep("B", 10)),
                    size.text = 8)

## ---- fig.width = 7, fig.height = 5--------------------------------------
library(ggthemes)
custom1 <- res[[1]] + theme_excel() + scale_colour_excel()
custom2 <- res[[2]] + theme_excel() + scale_colour_excel()
balance.combine(custom1, custom2)

