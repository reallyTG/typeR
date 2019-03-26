## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE, 
  fig.align = "center", 
  fig.width = 6,
  warnings = FALSE
)

library(ExPanDaR)
library(knitr)
library(kableExtra)

## ----variables-----------------------------------------------------------
kable(data.frame(Variable=russell_3000_data_def$var_name, 
                 Definition=russell_3000_data_def$var_def), 
      row.names = FALSE)

## ----cross-sectional_ids-------------------------------------------------
cs_ids <- unique(russell_3000[,c("coid", "coname")])
identical(cs_ids$coid, unique(russell_3000$coid))

identical(cs_ids$coname, unique(russell_3000$coname))

## ----duplicates----------------------------------------------------------
any(duplicated(russell_3000[,c("coid", "period")]))

## ----missing_obs---------------------------------------------------------
prepare_missing_values_graph(russell_3000, ts_id = "period")

## ----descriptive_statistics_table----------------------------------------
r3 <- droplevels(russell_3000[russell_3000$period > "FY2013",
                              c("coid", "coname", "period", "sector", "toas",
                                "nioa", "cfoa", "accoa", "return")])
t <- prepare_descriptive_table(r3)
t$kable_ret  %>%
  kable_styling("condensed", full_width = F, position = "center")

## ----extreme_observations------------------------------------------------
t <- prepare_ext_obs_table(na.omit(r3[c("coname", "period", "nioa")]))
t$kable_ret %>%
  kable_styling("condensed", full_width = F, position = "center")

## ----winsorizing---------------------------------------------------------
r3win <- treat_outliers(r3, percentile = 0.01)
t <- prepare_ext_obs_table(na.omit(r3win[c("coname", "period", "nioa")]))
t$kable_ret %>%
  kable_styling("condensed", full_width = F, position = "center")

## ----descriptive_statistics_table_winsorized-----------------------------
t <- prepare_descriptive_table(r3win)
t$kable_ret  %>%
  kable_styling("condensed", full_width = F, position = "center")

## ----correlation_table---------------------------------------------------
t<- prepare_correlation_table(r3win, bold = 0.01, format="html")
t$kable_ret %>%
  kable_styling("condensed", full_width = F, position = "center")

## ----correlation_graph, fig.width = 4, fig.height= 4---------------------
ret <- prepare_correlation_graph(r3win)

## ----time_trend_plot-----------------------------------------------------
graph <- prepare_trend_graph(r3win[c("period", "nioa", "cfoa", "accoa")], "period")
graph$plot

## ----quantile_plot-------------------------------------------------------
graph <- prepare_quantile_trend_graph(r3win[c("period", "return")], "period", c(0.05, 0.25, 0.5, 0.75, 0.95))
graph$plot

## ----scatter_plot, fig.width = 7, fig.height= 6--------------------------
prepare_scatter_plot(r3win, x="nioa", y="return", color="sector", size="toas", loess = 1)

## ----regressions---------------------------------------------------------
dvs <- c("return", "return", "return", "return", "return", "return")
idvs <- list(c("nioa"), 
             c("cfoa"), 
             c("accoa"), 
             c("cfoa", "accoa"), 
             c("nioa", "accoa"), 
             c("nioa", "accoa")) 
feffects <- list("period", "period", "period", 
                 c("period", "coid"), c("period", "coid"), c("period", "coid"))
clusters <- list("", "", "", c("coid"), c("coid"), c("period", "coid"))
t <- prepare_regression_table(r3win, dvs, idvs, feffects, clusters)
htmltools::HTML(t$table)

## ----sub-sample_regressions----------------------------------------------
t <- prepare_regression_table(r3win, "return", c("nioa", "accoa"), byvar="period")
htmltools::HTML(t$table)

