## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(circumplex)
library(ggplot2)
library(ggforce)
library(tibble)
library(kableExtra)
set.seed(12345)

## ----group---------------------------------------------------------------
data("jz2017")
data("iipsc")
jz2017s <- standardize(jz2017, PA:NO, octants(), instrument = iipsc, sample = 1)
results <- ssm_analyze(jz2017s, PA:NO, octants(), grouping = Gender)
summary(results)

## ----group_table, echo = FALSE-------------------------------------------
ssm_table(results, render = FALSE) %>% 
  kable(caption = circumplex:::dcaption(results)) %>% 
  kable_styling(full_width = TRUE, font_size = 12)

## ----group_plot, fig.width = 7.5, fig.height = 4, out.width = "100%"-----
ssm_plot(results)

## ----group_plot_lowfit, fig.width = 7.5, fig.height = 4, out.width = "100%"----
ssm_plot(results, lowfit = FALSE)

## ----measures------------------------------------------------------------
results2 <- ssm_analyze(jz2017, PA:NO, octants(), measures = c(NARPD, ASPD))
summary(results2)

## ----measures_table, echo = FALSE----------------------------------------
ssm_table(results2, render = FALSE) %>% 
  kable(caption = circumplex:::dcaption(results2)) %>% 
  kable_styling(full_width = TRUE, font_size = 12)

## ----measures_plot, fig.width = 7.5, fig.height = 4, out.width = "100%"----
ssm_plot(results2)

## ----general-------------------------------------------------------------
results3 <- ssm_analyze(jz2017, PA:NO, octants(), grouping = Gender, measures = PARPD:SZTPD)
summary(results3)

## ----general_table, echo = FALSE-----------------------------------------
ssm_table(results3, render = FALSE) %>% 
  kable(caption = circumplex:::dcaption(results3)) %>% 
  kable_styling(full_width = TRUE, font_size = 12)

## ----general_plot, fig.width = 7.5, fig.height = 4, out.width = "100%"----
ssm_plot(results3)

## ----model_contrast------------------------------------------------------
results4 <- ssm_analyze(jz2017s, PA:NO, octants(), grouping = Gender, contrast = "model")
summary(results4)

## ----model_table, echo = FALSE-------------------------------------------
ssm_table(results4, render = FALSE) %>% 
  kable(caption = circumplex:::dcaption(results4)) %>% 
  kable_styling(full_width = TRUE, font_size = 12)

## ----model_plot, fig.width = 7.5, fig.height = 4, out.width = "100%"-----
ssm_plot(results4)

## ----measure_contrast----------------------------------------------------
results5 <- ssm_analyze(jz2017, PA:NO, octants(), measures = c(NARPD, ASPD),
  contrast = "test")
summary(results5)

## ----measure_contrast_table, echo = FALSE, results = "asis"--------------
ssm_table(results5, render = FALSE) %>% 
  kable(caption = circumplex:::dcaption(results5)) %>% 
  kable_styling(full_width = TRUE, font_size = 12)

## ----measure_contrast_plot, fig.width = 7.5, fig.height = 4, out.width = "100%"----
ssm_plot(results5)

## ----group_contrast------------------------------------------------------
results6 <- ssm_analyze(jz2017, PA:NO, octants(), measures = BORPD, 
  grouping = Gender, contrast = "test")
summary(results6)

## ----group_contrast_table, echo = FALSE, results = "asis"----------------
ssm_table(results6, render = FALSE) %>% 
  kable(caption = circumplex:::dcaption(results6)) %>% 
  kable_styling(full_width = TRUE, font_size = 12)

## ----group_contrast_plot, fig.width = 7.5, fig.height = 4, out.width = "100%"----
ssm_plot(results6)

## ----taxonomy, echo = FALSE----------------------------------------------
msr <- c("FALSE", "FALSE", "FALSE", "TRUE",  "TRUE",  "TRUE",  "TRUE")
grp <- c("FALSE", "TRUE",  "TRUE",  "FALSE", "FALSE", "TRUE",  "TRUE")
ctr <- c("FALSE", "FALSE", "TRUE",  "FALSE", "TRUE",  "FALSE", "TRUE")
tab <- tibble(
  `#` = c(1, 2, 3, 4, 5, 6, 7),
  Usage = c(
    "Examine overall mean profile",
    "Examine groups' mean profiles",
    "Compare groups' mean profiles",
    "Examine variables' correlation profiles",
    "Compare variables' correlation profiles",
    "Examine groups' correlation profiles",
    "Compare groups' correlation profiles"
  ),
  measures = cell_spec(msr, color = ifelse(msr == "TRUE", "blue", "black")),
  grouping = cell_spec(grp, color = ifelse(grp == "TRUE", "blue", "black")),
  contrast = cell_spec(ctr, color = ifelse(ctr == "TRUE", "blue", "black"))
)
knitr::kable(tab, escape = FALSE) %>% 
  column_spec(2, width = "3in") %>% 
  add_header_above(c("", "", "Arguments Needed" = 3))

## ----append, echo = FALSE------------------------------------------------
res1 <- ssm_analyze(jz2017s, PA:NO, octants())
res2 <- ssm_analyze(jz2017s, PA:NO, octants(), grouping = Gender)
tab1 <- ssm_table(res1, xy = FALSE, render = FALSE)
tab2 <- ssm_table(res2, xy = FALSE, render = FALSE)
ssm_append(tab1, tab2, render = FALSE) %>% 
  kable() %>% 
  kable_styling(full_width = TRUE, font_size = 12)

## ----amax, fig.width = 7.5, fig.height = 4, out.width = "100%"-----------
ssm_plot(results4, amax = 0.6)

## ----custom, fig.width = 7.5, fig.height = 4, out.width = "100%"---------
ssm_plot(results6, xy = FALSE, color = "blue", linesize = 1,
  axislabel = "BORPD: Male - Female")

