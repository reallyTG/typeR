## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = NA
)

## ------------------------------------------------------------------------
library(r4lineups)
data(nortje2012)

## ---- echo=FALSE, results='asis'-----------------------------------------
pander::pandoc.table(nortje2012[1:3,], "nortje2012 data")

## ---- include=FALSE------------------------------------------------------
lineup_vec   <- nortje2012$lineup_1
lineup_list  <- as.list(nortje2012)
lineup_table <- table(lineup_vec)

## ------------------------------------------------------------------------
library(r4lineups)

lineup_prop_vec(lineup_vec, target_pos = 3, k = 8)

## ---- indent = "  ", warning=FALSE---------------------------------------
bootobject <- boot::boot(lineup_vec, lineup_prop_boot, target_pos = 3, R = 1000)
bootobject

## ---- indent = "  ", warning=FALSE---------------------------------------
cis <- boot::boot.ci(bootobject, conf = 0.95, type = "bca")
cis

## ------------------------------------------------------------------------
allprop(lineup_vec, k = 8)

## ---- indent = "  "------------------------------------------------------
lineuprops.ci <- lineup_boot_allprop(lineup_vec, target_pos, k = 8)
lineuprops.ci

## ---- indent = "  "------------------------------------------------------
func_size_report(lineup_vec, target_pos = 3, k = 8)

## ---- indent = "  "------------------------------------------------------
esize_m(table(lineup_vec), k = 8, both = TRUE)


## ----indent = "  "-------------------------------------------------------
#Create a dataframe of bootstrapped lineup data
bootdata <- gen_boot_samples(lineup_vec, 1000)

#Calculate effective size for each lineup in bootdata
#Pass bootstrap df to function
#Nominal size is again declared by user
lineupsizes <- gen_esize_m(bootdata, k = 8)

#Pass vector of boostrapped effective sizes to gen_esize_m_ci
#to calculate lower and upper CIs with desired level of alpha
gen_esize_m_ci(lineupsizes, perc = .025)
gen_esize_m_ci(lineupsizes, perc = .975)

## ---- indent = "  "------------------------------------------------------
gen_boot_propmean_se(lineupsizes)

## ------------------------------------------------------------------------
#Compute effective size from a single vector of lineup choices
esize_T(lineup_table)

#Compute bootstrapped effective size
esize_boot <- boot::boot(lineup_table, esize_T_boot, R = 1000)

#View boot object
esize_boot

#Get confidence intervals
esize_boot.ci <- boot::boot.ci(esize_boot)
esize_boot.ci


## ------------------------------------------------------------------------
eff_size_per_foils(lineup_vec, target_pos, k = 8, conf = 0.95)

## ------------------------------------------------------------------------
#Get data
linedf <- nortje2012[1:2]

#Compare effective size
effsize_compare(linedf)

## ---- indent = "  "------------------------------------------------------
#Target present & target absent lineup data for 1 lineup pair 
TP_lineup <- nortje2012$lineup_1
TA_lineup <- nortje2012$lineup_3

#Compute diagnosticity ratio
diag_ratio_W(TP_lineup, TA_lineup, pos_pres = 3, pos_abs = 7, k1 =8, k2 = 8)
diag_ratio_T(TP_lineup, TA_lineup, pos_pres = 3, pos_abs = 7, k1 =8, k2 = 8)


## ---- indent = "  "------------------------------------------------------
var_diag_ratio(TP_lineup, TA_lineup, 3, 7, 8, 8)

## ---- indent = "  "------------------------------------------------------
#Target present data:
TP_lineup1 <-       round(runif(100,1,6))
TP_lineup2 <-       round(runif(70,1,5))
TP_lineup3 <-       round(runif(20,1,4))
lineup_pres_list <- list(TP_lineup1, TP_lineup2, TP_lineup3)

#Target absent data:
TA_lineup1 <-       round(runif(100,1,6))
TA_lineup2 <-       round(runif(70,1,5))
TA_lineup3 <-       round(runif(20,1,4))
lineup_abs_list <-  list(TA_lineup1, TA_lineup2, TA_lineup3)


## ------------------------------------------------------------------------
lineup1_pos <- c(1, 2, 3, 4, 5, 6)
lineup2_pos <- c(1, 2, 3, 4, 5)
lineup3_pos <- c(1, 2, 3, 4)
pos_list    <- list(lineup1_pos, lineup2_pos, lineup3_pos)

## ---- include = FALSE----------------------------------------------------
k <- c(6, 5, 4)

## ---- warning=FALSE------------------------------------------------------
homog_diag(lineup_pres_list, lineup_abs_list, pos_list, k)

## ---- echo=FALSE---------------------------------------------------------
knitr::include_graphics("homog.png", dpi = 120)

## ---- echo = F, results='asis', warning=FALSE----------------------------
#Load ROC data: mickwick sample data
data(mickwick)
pander::pandoc.table(mickwick[1:8,], "Confacc data")

## ---- fig.cap= "ROC Curve for Confidence ~ Accuracy", fig.width= 5, warning=FALSE----
#Call roc function
make_roc(mickwick)

## ------------------------------------------------------------------------
foil1 <- magick::image_read('https://raw.githubusercontent.com/tmnaylor/malpass_foils/master/malp1.jpg')

## ---- fig.align='center'-------------------------------------------------
print(foil1)

## ---- echo=FALSE---------------------------------------------------------
knitr::include_graphics("lineupimage1.png")

## ---- echo = FALSE, fig.cap= "Set of faces is printed to viewer pane"----
knitr::include_graphics("lineupimage2.png", dpi = 100)

## ---- echo = FALSE, fig.cap= "Returns factor loading for each face"------
knitr::include_graphics("lineupimage3.png")

