## ----setup, include=FALSE------------------------------------------------
library(tadaatoolbox)
knitr::opts_chunk$set(message = FALSE, warning = FALSE)

## ----highlevel_intro, results='asis', echo=F-----------------------------
cat(paste0("- **", apropos("tadaa_"), "**", collapse = "\n"))

## ----t-test--------------------------------------------------------------
tadaa_t.test(ngo, stunzahl, geschl, print = "markdown")

## ----wilcox--------------------------------------------------------------
tadaa_wilcoxon(ngo, stunzahl, geschl, print = "markdown")

## ----anova---------------------------------------------------------------
tadaa_aov(stunzahl ~ jahrgang * geschl, data = ngo, print = "markdown")

## ----kruskal-------------------------------------------------------------
tadaa_kruskal(stunzahl ~ jahrgang, data = ngo, print = "markdown")

## ----pairw_t-------------------------------------------------------------
tadaa_pairwise_t(ngo, response = deutsch, group1 = jahrgang, p.adjust = "bonf", print = "markdown")

tadaa_pairwise_t(ngo, response = deutsch, group1 = jahrgang, group2 = geschl, p.adjust = "sidakSD", print = "markdown")

## ----normtest, eval=FALSE------------------------------------------------
#  library(dplyr)
#  print("test")
#  cols <- ngo[c("deutsch", "englisch", "mathe")]
#  
#  tadaa_normtest(data = cols, method = "shapiro", print = "markdown")

## ----confint-------------------------------------------------------------
library(ggplot2)

ggplot(data = ngo, aes(x = jahrgang, y = deutsch)) +
  stat_summary(fun.data = "mean_ci_t", geom = "errorbar") +
  theme_tadaa()

## ----mean_ci_plot--------------------------------------------------------
tadaa_mean_ci(data = ngo, response = deutsch, group = jahrgang) +
  theme_tadaa()

## ----tadaa_int, fig.width=6----------------------------------------------
library(ggplot2)
if (!("cowplot" %in% installed.packages())) install.packages("cowplot")

tadaa_int(data = ngo, response = stunzahl, group1 = jahrgang, group2 = geschl, grid = T, brewer_palette = "Set1")

## ----data_ngo, eval=FALSE------------------------------------------------
#  ngo <- ryouready::d.ngo
#  
#  ## sjPlot value labels
#  ngo$geschl   <- sjmisc::set_labels(ngo$geschl,   c("M\u00e4nnlich", "Weiblich"))
#  ngo$abschalt <- sjmisc::set_labels(ngo$abschalt, c("Ja", "Nein"))
#  ngo$jahrgang <- sjmisc::set_labels(ngo$jahrgang, c("11", "12", "13"))
#  ngo$hausauf  <- sjmisc::set_labels(ngo$hausauf,  c("gar nicht", "weniger als halbe Stunde",
#                                                     "halbe Stunde bis Stunde", "1 bis 2 Stunden",
#                                                     "2 bis 3 Stunden", "3 bis 4 Stunden",
#                                                     "mehr als 4 Stunden"))
#  
#  ## factors
#  ngo$geschl   <- factor(ngo$geschl,   labels = c("M\u00e4nnlich", "Weiblich"))
#  ngo$jahrgang <- factor(ngo$jahrgang, labels = c("11", "12", "13"), ordered = TRUE)
#  ngo$hausauf  <- car::recode(ngo$hausauf,  "0 = NA")
#  ngo$abschalt <- car::recode(ngo$abschalt, "0 = NA")
#  ngo$abschalt <- factor(ngo$abschalt, labels = c("Ja", "Nein"))
#  
#  ## Variable labels
#  ngo$geschl   <- sjmisc::set_label(ngo$geschl, "Geschlecht")
#  ngo$abschalt <- sjmisc::set_label(ngo$abschalt, "Abschalten")
#  ngo$jahrgang <- sjmisc::set_label(ngo$jahrgang, "Jahrgang")
#  ngo$hausauf  <- sjmisc::set_label(ngo$hausauf, "Hausaufgaben")
#  
#  ## Saving
#  ngo <- dplyr::tbl_df(ngo)

