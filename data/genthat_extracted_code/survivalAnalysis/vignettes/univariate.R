## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(survival::lung, 10))

## ---- warning=FALSE, message=FALSE---------------------------------------
library(tidyverse)
library(tidytidbits)
library(survivalAnalysis)

## ------------------------------------------------------------------------
survival::lung %>%
  analyse_survival(vars(time, status))

## ------------------------------------------------------------------------
survival::lung %>%
  analyse_survival(vars(time, status)) %>%
  print(timespan_unit="months")

## ------------------------------------------------------------------------
survival::lung %>%
  count_by(ph.ecog)

## ------------------------------------------------------------------------
survival::lung %>%
  mutate(ecog=recode_factor(ph.ecog, `0`="0", `1`="1", `2`="2-3", `3`="2-3")) %>%
  analyse_survival(vars(time, status), by=ecog) ->
result
print(result)

## ------------------------------------------------------------------------
survival::lung %>%
  analyse_survival(vars(time, status), 
                   by=ph.ecog <= 1,
                   by_label_map=c(`TRUE`="ECOG 1-2",
                                  `FALSE`="ECOG 2-3"))

## ---- fig.width=6, fig.height=4------------------------------------------
kaplan_meier_plot(result)

## ---- fig.width=8, fig.height=5------------------------------------------
kaplan_meier_plot(result,
                  break.time.by="breakByQuarterYear",
                  xlab=".OS.months",
                  legend.title="ECOG Status",
                  hazard.ratio=T,
                  risk.table=TRUE,
                  table.layout="clean",
                  ggtheme=ggplot2::theme_bw(10))

## ---- fig.width=8, fig.height=10, results='hide'-------------------------
default_args <- list(break.time.by="breakByMonth",
                     xlab=".OS.months",
                     legend.title="ECOG Status",
                     hazard.ratio=T,
                     risk.table=TRUE,
                     table.layout="clean",
                     ggtheme=ggplot2::theme_bw(10))
list(result,
     survival::lung %>%
       analyse_survival(vars(time, status), 
                        by=sex,
                        by_label_map=c(`1`="Male", `2`="Female"))
     ) %>%
  kaplan_meier_grid(nrow=2,
                    default_args,
                    break.time.by="breakByQuarterYear",
                    mapped_plot_args=list(
                      legend.title=c("ECOG Status", "Sex"),
                      title=c("A", "B")
                    )) %>%
  print


