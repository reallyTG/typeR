## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(echo=TRUE, comment=NA)

## ----include = FALSE-----------------------------------------------------
library(beezdemand)

## ----example-data-set, echo=FALSE, results='asis'------------------------
knitr::kable(apt[c(1:8, 17:24), ])

## ----example-wide, results = 'asis', echo = FALSE------------------------
wide <- tidyr::spread(apt, id, y)
knitr::kable(wide)

## ----example-w2l, eval = FALSE-------------------------------------------
#  long <- tidyr::gather(wide, id, y, -x)

## ----example-l2w, eval = FALSE-------------------------------------------
#  wide <- tidyr::spread(long, id, y)

## ----descriptive, eval=FALSE---------------------------------------------
#  GetDescriptives(apt, bwplot = TRUE, outdir = "../plots/", device = "png", filename = "bwplot")

## ----descriptive-output, echo=FALSE, results='asis'----------------------
descr <- GetDescriptives(apt)
knitr::kable(descr)

## ----change-data, eval = FALSE-------------------------------------------
#  ChangeData(apt, nrepl = 1, replnum = 0.01, rem0 = FALSE, remq0e = FALSE, replfree = NULL)

## ----unsystematic, eval=FALSE--------------------------------------------
#  CheckUnsystematic(apt, deltaq = 0.025, bounce = 0.1, reversals = 0, ncons0 = 2)

## ----unsystematic-output, echo=FALSE, results='asis'---------------------
knitr::kable(head(CheckUnsystematic(apt, deltaq = 0.025, bounce = 0.1, reversals = 0, ncons0 = 2), 5))

## ----empirical, eval=FALSE-----------------------------------------------
#  GetEmpirical(apt)

## ----empirical-output, echo=FALSE, results='asis'------------------------
knitr::kable(head(GetEmpirical(apt), 5))

## ----zero-warning, eval=FALSE--------------------------------------------
#  Warning message:
#  Zeros found in data not compatible with equation! Dropping zeros!

## ----hs, eval=FALSE------------------------------------------------------
#  FitCurves(dat = apt, equation = "hs", k, agg = NULL, detailed = FALSE, xcol = "x", ycol = "y", idcol = "id", groupcol = NULL, lobound, hibound)

## ----hs-setup, include=FALSE---------------------------------------------
fc <- FitCurves(apt, "hs")
hs1 <- head(fc, 5)[ , 1:6]
hs2 <- head(fc, 5)[ , 7:11]
hs3 <- head(fc, 5)[ , 12:20]
hs4 <- head(fc, 5)[ , 21:24]

## ----hs-output, echo=FALSE, results='asis'-------------------------------
knitr::kable(hs1, caption = "Empirical Measures")
knitr::kable(hs2, caption = "Fitted Measures")
knitr::kable(hs3, caption = "Uncertainty and Model Information")
knitr::kable(hs4, caption = "Derived Measures")

## ----koff, eval=FALSE----------------------------------------------------
#  FitCurves(apt, "koff")

## ----koff-setup, include = FALSE-----------------------------------------
fc <- FitCurves(apt, "koff")
koff1 <- head(fc, 5)[ , 1:6]
koff2 <- head(fc, 5)[ , 7:11]
koff3 <- head(fc, 5)[ , 12:20]
koff4 <- head(fc, 5)[ , 21:24]

## ----koff-output, echo=FALSE, results='asis'-----------------------------
knitr::kable(koff1, caption = "Empirical Measures")
knitr::kable(koff2, caption = "Fitted Measures")
knitr::kable(koff3, caption = "Uncertainty and Model Information")
knitr::kable(koff4, caption = "Derived Measures")

## ----agg-mean, eval = FALSE----------------------------------------------
#  FitCurves(apt, "hs", agg = "Mean")

## ----agg-mean-setup, include = FALSE-------------------------------------
mn <- FitCurves(apt, "hs", agg = "Mean")
mn1 <- head(mn)[ , 1:6]
mn2 <- head(mn)[ , 7:11]
mn3 <- head(mn)[ , 12:20]
mn4 <- head(mn)[ , 21:24]

## ----agg-mean-output, echo = FALSE, results = 'asis'---------------------
knitr::kable(mn1, caption = "Empirical Measures")
knitr::kable(mn2, caption = "Fitted Measures")
knitr::kable(mn3, caption = "Uncertainty and Model Information")
knitr::kable(mn4, caption = "Derived Measures")

## ----agg-pooled, eval = FALSE--------------------------------------------
#  FitCurves(apt, "hs", agg = "Pooled")

## ----agg-pooled-setup, include = FALSE-----------------------------------
pl <- FitCurves(apt, "hs", agg = "Pooled")
pl1 <- head(pl)[ , 1:6]
pl2 <- head(pl)[ , 7:11]
pl3 <- head(pl)[ , 12:20]
pl4 <- head(pl)[ , 21:24]

## ----agg-pooled-output, echo = FALSE, results = 'asis'-------------------
knitr::kable(pl1, caption = "Empirical Measures")
knitr::kable(pl2, caption = "Fitted Measures")
knitr::kable(pl3, caption = "Uncertainty and Model Information")
knitr::kable(pl4, caption = "Derived Measures")

## ----share, eval=FALSE---------------------------------------------------
#  FitCurves(apt, "hs", k = "share")

## ---- include=FALSE------------------------------------------------------
df <- FitCurves(apt, "hs", k = "share")

## ----share-output, echo=FALSE, results='asis'----------------------------
knitr::kable(head(df, 5)[ , 1:6], caption = "Empirical Measures")
knitr::kable(head(df, 5)[ , 7:11], caption = "Fitted Measures")
knitr::kable(head(df, 5)[ , 12:20], caption = "Uncertainty and Model Information")
knitr::kable(head(df, 5)[ , 21:24], caption = "Derived Measures")

## ----ftest, eval=FALSE---------------------------------------------------
#  ExtraF(apt, "hs")

## ----learn, eval=FALSE---------------------------------------------------
#  ?CheckUnsystematic

## ----learn-output, eval=FALSE--------------------------------------------
#  CheckUnsystematic          package:beezdemand          R Documentation
#  
#  Systematic Purchase Task Data Checker
#  
#  Description:
#  
#       Applies Stein, Koffarnus, Snider, Quisenberry, & Bickels (2015)
#       criteria for identification of nonsystematic purchase task data.
#  
#  Usage:
#  
#       CheckUnsystematic(dat, deltaq = 0.025, bounce = 0.1, reversals = 0,
#         ncons0 = 2)
#  
#  Arguments:
#  
#       dat: Dataframe in long form. Colums are id, x, y.
#  
#    deltaq: Numeric vector of length equal to one. The criterion by which
#            the relative change in quantity purchased will be compared.
#            Relative changes in quantity purchased below this criterion
#            will be flagged. Default value is 0.025.
#  
#    bounce: Numeric vector of length equal to one. The criterion by which
#            the number of price-to-price increases in consumption that
#            exceed 25% of initial consumption at the lowest price,
#            expressed relative to the total number of price increments,
#            will be compared. The relative number of price-to-price
#            increases above this criterion will be flagged. Default value
#            is 0.10.
#  
#  reversals: Numeric vector of length equal to one. The criterion by
#            which the number of reversals from number of consecutive (see
#            ncons0) 0s will be compared. Number of reversals above this
#            criterion will be flagged. Default value is 0.
#  
#    ncons0: Numer of consecutive 0s prior to a positive value is used to
#            flag for a reversal. Value can be either 1 (relatively more
#            conservative) or 2 (default; as recommended by Stein et al.,
#            (2015).
#  
#  Details:
#  
#       This function applies the 3 criteria proposed by Stein et al.,
#       (2015) for identification of nonsystematic purchase task data. The
#       three criteria include trend (deltaq), bounce, and reversals from
#       0. Also reports number of positive consumption values.
#  
#  Value:
#  
#       Dataframe
#  
#  Author(s):
#  
#       Brent Kaplan <bkaplan.ku@gmail.com>
#  
#  Examples:
#  
#       ## Using all default values
#       CheckUnsystematic(apt, deltaq = 0.025, bounce = 0.10, reversals = 0, ncons0 = 2)
#       ## Specifying just 1 zero to flag as reversal
#       CheckUnsystematic(apt, deltaq = 0.025, bounce = 0.10, reversals = 0, ncons0 = 1)

