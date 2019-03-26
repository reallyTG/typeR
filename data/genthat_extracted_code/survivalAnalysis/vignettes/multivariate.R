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
covariate_names <- c(age="Age at Dx",
                     sex="Sex",
                     ph.ecog="ECOG Status",
                     wt.loss="Weight Loss (6 mo.)",
                     `sex:female`="Female",
                     `ph.ecog:0`="ECOG 0",
                     `ph.ecog:1`="ECOG 1",
                     `ph.ecog:2`="ECOG 2",
                     `ph.ecog:3`="ECOG 3")

survival::lung %>%
  mutate(sex=rename_factor(sex, `1` = "male", `2` = "female")) %>%
  analyse_multivariate(vars(time, status),
                       covariates = vars(age, sex, ph.ecog, wt.loss),
                       covariate_name_dict = covariate_names) ->
  result
print(result)

## ------------------------------------------------------------------------
survival::lung %>%
  mutate(sex=rename_factor(sex, `1` = "male", `2` = "female"),
         ph.ecog = as.factor(ph.ecog)) %>%
  analyse_multivariate(vars(time, status),
                       covariates = vars(sex, ph.ecog),
                       covariate_name_dict=covariate_names,
                       reference_level_dict=c(ph.ecog="0"))

## ------------------------------------------------------------------------
exp((75-45)*log(1.04)) 

## ---- fig.width=8, fig.height=5------------------------------------------
forest_plot(result)

## ---- fig.width=9.7, fig.height=1.7--------------------------------------
forest_plot(result,
            factor_labeller = covariate_names,
            endpoint_labeller = c(time="OS"),
            orderer = ~order(HR),
            labels_displayed = c("endpoint", "factor", "n"),
            ggtheme = ggplot2::theme_bw(base_size = 10),
            relative_widths = c(1, 1.5, 1),
            HR_x_breaks = c(0.25, 0.5, 0.75, 1, 1.5, 2))

## ---- fig.width=9.7, fig.height=1.7--------------------------------------

df <- survival::lung %>% mutate(sex=rename_factor(sex, `1` = "male", `2` = "female"))

map(vars(age, sex, ph.ecog, wt.loss), function(by)
{
  analyse_multivariate(df,
                       vars(time, status),
                       covariates = list(by), # covariates expects a list
                       covariate_name_dict = covariate_names)
}) %>%
  forest_plot(factor_labeller = covariate_names,
              endpoint_labeller = c(time="OS"),
              orderer = ~order(HR),
              labels_displayed = c("endpoint", "factor", "n"),
              ggtheme = ggplot2::theme_bw(base_size = 10))

## ---- fig.width=9.7, fig.height=1.7--------------------------------------

survival::lung %>% 
  mutate(kras=sample(c("WT", "G12C", "G12V", "G12D", "G12A"), 
                     nrow(.), 
                     replace = T, 
                     prob = c(0.6, 0.24, 0.16, 0.06, 0.04))
          ) %>%
  analyse_survival(vars(time, status), by=kras) %>%
  forest_plot(use_one_hot=TRUE,
              endpoint_labeller = c(time="OS"),
              orderer = ~order(HR),
              labels_displayed = c("endpoint", "factor", "n"),
              ggtheme = ggplot2::theme_bw(base_size = 10))

