## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
knitr::opts_chunk$set(fig.width=7, fig.height=5)
options(tibble.print_min = 6L, tibble.print_max = 6L)
library(forestmangr)

## ------------------------------------------------------------------------
library(forestmangr)
data(exfm7)
data_ex <- exfm7
data_ex

## ------------------------------------------------------------------------
data_ex_sma <- smalianwb(data_ex,"di_wb", "hi","TREE")
head(as.data.frame(data_ex_sma))

## ------------------------------------------------------------------------
data_ex_sma <- smalianwob(data_ex_sma, "di_wb", "hi", "bark_t","TREE", bt_mm_to_cm = T)
head(as.data.frame(data_ex_sma))

## ------------------------------------------------------------------------
data_ex_sma <- data_ex %>% 
  smalianwb("di_wb", "hi", "TREE") %>% 
  smalianwob("di_wb", "hi", "bark_t", "TREE", bt_mm_to_cm = T)
head(as.data.frame(data_ex_sma))

## ---- warning=FALSE, message=FALSE---------------------------------------
average_tree_curve(df = data_ex_sma, d = "di_wb", dbh = "DBH", h = "hi", th = "TH")

## ------------------------------------------------------------------------
data_ex_vol_arvore <- vol_summarise(data_ex_sma, dbh = "DBH", th = "TH", 
                                  vwb="VWB",tree = "TREE",vwob="VWOB")
data_ex_vol_arvore

## ---- warning=FALSE, message=FALSE---------------------------------------
data_ex_vol_arvore %>% 
  lm_table(log(VWB) ~  log(DBH) + log(TH),output="merge_est",est.name="Schumacher") %>%
  lm_table(log(VWB) ~  log(DBH),output="merge_est",est.name="Husch") %>%
resid_plot("VWB", "Schumacher", "Husch")

## ------------------------------------------------------------------------
tabcoef_vwb <- lm_table(data_ex_vol_arvore, log(VWB) ~  log(DBH) + log(TH) )
tabcoef_vwb

## ------------------------------------------------------------------------
tabcoef_vwob <- lm_table(data_ex_vol_arvore, log(VWOB) ~  log(DBH) + log(TH) )
tabcoef_vwob

