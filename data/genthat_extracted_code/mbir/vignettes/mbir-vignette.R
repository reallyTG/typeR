## ---- out.width = "690px",echo=FALSE, fig.align='center',fig.cap="Figure 1: decision tree illustration"----
knitr::include_graphics("figures/twosample.jpg")

## ---- echo=FALSE---------------------------------------------------------
then<-c(4.51, 4.46, 4.36, 4.57, 4.50, 4.49, 4.30, 4.57, 4.44, 4.67, 4.48, 4.32, 4.45, 4.52, 4.35, 4.50, 4.54, 4.52, 4.39, 4.54)
now<-c(4.54, 4.68, 4.70, 4.41, 4.47, 4.45, 4.45, 4.44, 4.52, 4.57, 4.49, 4.61, 4.50, 4.50, 4.53, 4.64, 4.46, 4.56, 4.53, 4.58)

## ----echo=FALSE,fig.width=5,fig.align='center'---------------------------
graphics::par(mfrow=c(1,2))
graphics::hist(then, col='gray', border='white', las=1, xlab = "2007", main = " ")
graphics::hist(now, col='gray', border='white', las=1, xlab = "2017", main = " ",ylab = " ")

## ------------------------------------------------------------------------
mbir::smd_test(x = now, y = then, paired = FALSE, auto = T)

## ----echo=FALSE----------------------------------------------------------
pre<-c(2, 1, 1, 4, 1, 1, 9, 1, 2, 2, 2, 3, 3, 2, 1, 1, 1, 1, 2, 1, 2, 1, 1, 3, 1)
post<-c(2, 4, 2, 1, 3, 4, 7, 2, 2, 2, 7, 2, 1, 1, 7, 1, 2, 2, 3, 2, 2, 2, 6, 9, 1)

## ----echo=FALSE,fig.width=5,fig.align='center'---------------------------
graphics::par(mfrow=c(1,2))
graphics::hist(pre, col='gray', border='white', las=1, xlab = "Pre-Test", main = " ")
graphics::hist(post, col='gray', border='white', las=1, xlab = "Post-Test", main = " ",ylab = " ")

## ------------------------------------------------------------------------
# Named a variable "mag" for later use within vignette
mag<-mbir::smd_test(post, pre, paired = T, auto = T)

## ------------------------------------------------------------------------
mbir::smd(es = 0.7, p = 0.02, df = 24)

## ------------------------------------------------------------------------
mbir::corr(r = 0.22, n = 30)

## ------------------------------------------------------------------------
mbir::odds(or = 3.25, p = 0.06)

## ----eval=FALSE----------------------------------------------------------
#  mbir::prop(p1, n1, p2, n2)

## ------------------------------------------------------------------------
mbir::prop(p1 = 0.53, n1 = 19, p2 = 0.38, n2 = 26)

## ----eval=FALSE----------------------------------------------------------
#  mbir::corr_diff(r1, n1, r2, n2)

## ---- eval=FALSE---------------------------------------------------------
#  # Female correlation test
#  female<-mbir::corr_test(F$bodyimage, F$wellbeing)
#  
#  # Male correlation test
#  male<-mbir::corr_test(M$bodyimage, M$wellbeing)
#  
#  # Test of Two Correlations
#  mbir::corr_diff(r1 = male$r.stat, n1 = 38, r2 = female$r.stat, n2 = 30)

## ----echo=FALSE----------------------------------------------------------
mbir::corr_diff(r1 = 0.41, n1 = 38, r2 = 0.53, n2 = 30)

## ------------------------------------------------------------------------
mbir::ss_smd(exp = 20, con = 18, es = 0.6)

## ------------------------------------------------------------------------
mbir::ss_corr(n = 25, r = 0.25)

## ------------------------------------------------------------------------
mbir::ss_odds(exp = 12, con = 16, or = 2.5)

## ------------------------------------------------------------------------
mbir::aipe_smd(moe = .5, paired = F)

## ------------------------------------------------------------------------
mbir::aipe_smd(moe = .5, paired = T, r = .65)

## ----eval=FALSE----------------------------------------------------------
#  mbir::es_convert(x, from = c("d", "or", "r"), to = c("d", "or", "r"))

## ------------------------------------------------------------------------
mbir::es_convert(0.2, from = "r", to = "or")

## ---- eval=FALSE---------------------------------------------------------
#  # Section 1.1. pre-test post-test 40 yard dash example:
#  mag<-mbir::smd_test(post, pre, paired = T, auto = T)

## ------------------------------------------------------------------------
# Wish to convert given Odds Ratio to Cohen's d:
mbir::es_convert(c(mag$or.LL, mag$or.stat, mag$or.UL), from = "or", to = "d")

## ---- echo=FALSE---------------------------------------------------------
high<-c(600,450,420,375,480,360,200,510,420,360,165,150,300,250,480,260,510,400,455,300,540,250,450,490,140,480,950,880,709,730,300)
low<-c(276,250,330,322,250,900,300,160,350,250,432,300,150,160,220,180,343,328,414,231,224,280,315,175,231,420,486,180,200,160,1440)

## ----echo=FALSE,fig.width=5,fig.align='center'---------------------------
graphics::par(mfrow=c(1,2))
graphics::hist(low, col='gray', border='white', las=1, xlab = "Low Sessions", main = " ")
graphics::hist(high, col='gray', border='white', las=1, xlab = "High Sessions", main = " ",ylab = " ")

## ----eval=FALSE----------------------------------------------------------
#  mbir::boot_test(x, y, conf.int, resample, med)

## ---- fig.align='center'-------------------------------------------------
mbir::boot_test(high, low, med = 100)

## ----eval=FALSE----------------------------------------------------------
#  df<-c(97.5,99.9,100.2,101.1,101.3,99.8)
#  mbir::swc_ind(x = df, swc = 0.25, type = "previous")

## ---- out.width = "350px",echo=FALSE, fig.align='center',fig.cap=" "-----
knitr::include_graphics("figures/swc_prev.jpeg")

## ----eval=FALSE----------------------------------------------------------
#  ## MBI From Previous Time Point:
#  ##
#  ##         Diff    N  T  P               MBI
#  ## 1 - 2    2.4    8  4 88   Likely Increase
#  ## 2 - 3    0.3   37 12 51               ---
#  ## 3 - 4    0.9   26  9 65               ---
#  ## 4 - 5    0.2   40 11 49               ---
#  ## 5 - 6   -1.5   76  7 17               ---

## ----eval=FALSE----------------------------------------------------------
#  mbir::swc_ind(x = df, swc = 0.25, ts = 0.2, type = "trend")

## ---- out.width = "350px",echo=FALSE, fig.align='center',fig.cap=" "-----
knitr::include_graphics("figures/swc_ind.jpeg")

## ----eval=FALSE----------------------------------------------------------
#  ##    Trend Parameters:
#  ## Slope     0.474
#  ## R-squared 0.283
#  ## F stat    2.973
#  ## P value   0.160
#  ##
#  ##         Very Unlikely Unlikely  Likely
#  ##         "Decrease"    "Trivial" "Increase"
#  ## MBI (%) "3"           "20"      "77"
#  ##
#  ##    MBI From Trend Line:
#  ##
#  ##  Point   Diff    N  T  P                  MBI
#  ##      1   -1.3   88  7  5         Likely Lower
#  ##      2    0.6   26 12 62                  ---
#  ##      3    0.5   30 13 57                  ---
#  ##      4    0.9   21 11 68                  ---
#  ##      5    0.6   26 13 61                  ---
#  ##      6   -1.4   90  5  5    Very Likely Lower

