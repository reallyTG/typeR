## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----Figure 1, echo=FALSE, fig.cap="Figure 1: Distance Matrix and its Matrix Profile.", out.width=350, out.height=350, message=FALSE, warning=FALSE----
knitr::include_graphics("mp_1.png")

## ----eval=FALSE, include=TRUE--------------------------------------------
#  set.seed(2018)
#  data <- cumsum(sample(c(-1, 1), 40000, TRUE))

## ----table1, echo=FALSE, message=FALSE, warnings=FALSE, results='asis'----
tabl <- "
|  | Elapsed Time^[These are results using only R code, no low-level C code optimizations] | Data size | Window size | Threads |
|-----------|:------------:|:---------:|:-----------:|:-------:|
| `scrimp()` | 45.30s | 40000 | 1000 | 1 |
| `stomp_par()` | 52.72s | 40000 | 1000 | 8 |
| `stomp()` | 136.01s | 40000 | 1000 | 1 |
| `stamp_par()` | 140.25s | 40000 | 1000 | 8 |
| `stamp()` | 262.03s | 40000 | 1000 | 1 |
"
cat(tabl) # output the table in a format good for HTML/PDF/docx conversion

