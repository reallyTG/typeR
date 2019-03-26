## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")


## ---- echo = FALSE-------------------------------------------------------
library(inspectr)
data("dataset")

## ----echo = FALSE--------------------------------------------------------
knitr::kable(dataset, format = "markdown", align = "l", row.names = FALSE)

## ----single_col_check1, echo = TRUE, eval = TRUE-------------------------
col_check("ID_var", dataset, numeric_check, output = FALSE)

## ----single_col_check2, echo = TRUE, eval = TRUE-------------------------
col_check("FName", dataset, character_check)

col_check("FName", dataset, character_blanks_check)

## ----value_check, echo = TRUE, eval = TRUE-------------------------------
##Need to resolve three dots issues for date_check
col_check("Perf_Lvl", dataset, val_check, values = c("Basic", "Intermediate", "Advanced"))

col_check("Var1", dataset, val_check, values = c(1:25))

## ----date_check, echo = TRUE, eval = TRUE--------------------------------
col_check("dates", dataset, date_check, begin = "06/02/1982", end = "11/11/1986")

## ----less_than, echo = TRUE, eval = TRUE---------------------------------
two_col_check("Var1", "Var2", dataset, less_than)

two_col_check("Var1", "Var2", dataset, less_than_equalto)

## ----greater_than, echo = TRUE, eval = TRUE------------------------------
two_col_check("Var2", "Var1", dataset, greater_than)

two_col_check("Var2", "Var1", dataset, greater_than_equalto)

## ----three_col_check, echo = TRUE, eval = TRUE---------------------------
three_col_check(colname1 = "Perf_Lvl", colname2 = "Var1", colname3 = "Var2",
                data = dataset, fun = function(col1, col2, col3){
                  col1 %in% c("Basic", "Intermediate", "Advanced") |
                    (is.na(col1) & (col3 %% 2 ==0) & (col2 %% 2 ==1 ))
})

