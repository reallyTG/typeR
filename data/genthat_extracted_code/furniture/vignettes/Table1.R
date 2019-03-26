## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(furniture)

## ----structure, eval=FALSE-----------------------------------------------
#  table1(.data, ..., splitby, row_wise, test, type, output, format_number, na.rm)

## ----data----------------------------------------------------------------
set.seed(84332)
## Create Fictitious Data containing several types of variables
df <- data.frame(a = sample(1:10000, 10000, replace = TRUE),
                 b = runif(10000) + rnorm(10000),
                 c = factor(sample(c(1,2,3,4,NA), 10000, replace=TRUE)),
                 d = factor(sample(c(0,1,NA), 10000, replace=TRUE)),
                 e = trunc(rnorm(10000, 20, 5)),
                 f = factor(sample(c(0,1,NA), 10000, replace=TRUE)))

## ----simple--------------------------------------------------------------
table1(df, 
       a, b, c, d, e)

## ----splitby-------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d)

## ----rowwise-------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       row_wise = TRUE)

## ----test----------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE)

## ----s_c-----------------------------------------------------------------
table1(df,
       f, a, b, c,
       splitby = ~d,
       test = TRUE,
       type = c("simple", "condensed"))

## ----meds----------------------------------------------------------------
table1(df,
       f, a, b, c,
       splitby = ~d,
       test = TRUE,
       type = c("simple", "condensed"),
       second = c("a", "b"))

## ----html----------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE,
       output = "html")

## ----formatnumber--------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE,
       format_number = TRUE)

## ----nakeep--------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE,
       na.rm = FALSE)

## ----tidyverse, fig.width=5, message=FALSE, warning=FALSE----------------
library(tidyverse)

df %>%
  filter(f == 1) %>%
  group_by(d) %>%
  table1(a, b, c,
         test = TRUE,
         type = c("simple", "condensed"))

## ----tidyverse2, fig.width=5, message=FALSE, warning=FALSE---------------
df %>%
  group_by(d, f) %>%
  table1(a, b, c,
         test = TRUE,
         type = c("simple", "condensed"))

## ------------------------------------------------------------------------
table1(df,
       "Avar" = a, "Bvar" = b, "Cvar" = c,
       splitby = ~d,
       test = TRUE)

## ---- warning=FALSE, message=FALSE---------------------------------------
table1(df,
       "A" = factor(ifelse(a > 1, 1, 0)), b, c,
       splitby = ~d,
       test = TRUE)

## ---- warning=FALSE, message=FALSE---------------------------------------
table1(df,
       factor(ifelse(a > 1, 1, 0)), b, c,
       splitby = ~d,
       test = TRUE,
       var_names = c("A New Variable", "B Variable", "C Variable"))

## ----dataframe-----------------------------------------------------------
tab1 = table1(df,
              a, b, c,
              splitby = ~d,
              test = TRUE)
as.data.frame(tab1)

