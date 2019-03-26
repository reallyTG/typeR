## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", warning = FALSE, message = FALSE)

## ------------------------------------------------------------------------
library(sjPlot)
data(efc)
m <- lm(barthtot ~ c160age + c12hour + c161sex + c172code, data = efc)
tab <- tab_model(m)

## ----echo = TRUE---------------------------------------------------------
cat(tab$page.style)

## ----echo = TRUE---------------------------------------------------------
cat(tab$page.content)

## ------------------------------------------------------------------------
tab_model(
  m,
  CSS = list(
    css.depvarhead = 'color: red;',
    css.centeralign = 'text-align: left;', 
    css.firsttablecol = 'font-weight: bold;', 
    css.summary = 'color: blue;'
  )
)

## ------------------------------------------------------------------------
tab_model(m, CSS = list(css.depvarhead = '+color: red;'))

## ------------------------------------------------------------------------
tab_model(m, CSS = css_theme("cells"))

