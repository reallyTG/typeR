## ---- echo=FALSE, message=FALSE------------------------------------------
library(descriptr)
library(dplyr)

## ----egdata--------------------------------------------------------------
str(mtcarz)

## ----screener------------------------------------------------------------
ds_screener(mtcarz)

## ----summary-------------------------------------------------------------
ds_summary_stats(mtcarz, mpg)

## ----cross---------------------------------------------------------------
ds_cross_table(mtcarz, cyl, gear)

## ----cross_tibble--------------------------------------------------------
ds_twoway_table(mtcarz, cyl, gear)

## ----cross_group, fig.width=7, fig.height=7, fig.align='centre'----------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k)

## ----cross_stack, fig.width=7, fig.height=7, fig.align='centre'----------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k, stacked = TRUE)

## ----cross_prop, fig.width=7, fig.height=7, fig.align='centre'-----------
k <- ds_cross_table(mtcarz, cyl, gear)
plot(k, proportional = TRUE)

## ----ftable--------------------------------------------------------------
ds_freq_table(mtcarz, cyl)

## ----ftable_bar, fig.width=7, fig.height=7, fig.align='centre'-----------
k <- ds_freq_table(mtcarz, cyl)
plot(k)

## ----fcont---------------------------------------------------------------
ds_freq_cont(mtcarz, mpg, 4)

## ----fcont_hist, fig.width=7, fig.height=7, fig.align='centre'-----------
k <- ds_freq_cont(mtcarz, mpg, 4)
plot(k)

## ----gsummary------------------------------------------------------------
k <- ds_group_summary(mtcarz, cyl, mpg)
k

## ----gsummary_tibble-----------------------------------------------------
k$tidy_stats

## ----gsum_boxplot, fig.width=7, fig.height=7, fig.align='centre'---------
k <- ds_group_summary(mtcarz, cyl, mpg)
plot(k)

## ----multistats----------------------------------------------------------
ds_multi_stats(mtcarz, mpg, disp, hp)

## ----oway----------------------------------------------------------------
ds_oway_tables(mtcarz)

## ----tway----------------------------------------------------------------
ds_tway_tables(mtcarz)

