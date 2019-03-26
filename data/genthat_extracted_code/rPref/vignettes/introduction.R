## ---- echo = FALSE, message = FALSE--------------------------------------
library(rPref)
suppressPackageStartupMessages(library(dplyr))

## ---- results='asis'-----------------------------------------------------
p <- high(mpg) * high(hp)
res <- psel(mtcars, p)
knitr::kable(select(res, mpg, hp))

## ---- collapse = TRUE----------------------------------------------------
p <- high(mpg, df = mtcars) * high(hp) * low(qsec)
p

## ---- results='asis'-----------------------------------------------------
res <- peval(p)
knitr::kable(select(res, mpg, hp, qsec))

## ---- results='asis'-----------------------------------------------------
res <- mtcars %>% filter(am == 0) %>% psel(p)
knitr::kable(select(res, am, mpg, hp, qsec))

## ------------------------------------------------------------------------
p <- true(am == 1) & high(gear)

## ---- results='asis'-----------------------------------------------------
p <- p * high(hp/cyl)
res <- psel(mtcars, p)
knitr::kable(select(res, am, gear, hp, cyl))

## ---- results='asis'-----------------------------------------------------
res <- psel(mtcars, p, top = 3)
knitr::kable(select(res, am, gear, hp, cyl, .level))

## ---- results='asis'-----------------------------------------------------
res <- psel(mtcars, p, at_least = 3)
knitr::kable(select(res, am, gear, hp, cyl, .level))

## ---- results='asis'-----------------------------------------------------
grouped_df <- group_by(mtcars, cyl)
res <- psel(grouped_df, low(hp) * low(mpg))
knitr::kable(select(res, cyl, hp, mpg))

