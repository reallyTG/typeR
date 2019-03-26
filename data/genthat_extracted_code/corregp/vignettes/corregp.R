## ----Setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(highlight = FALSE, size = "small")

## ----HairEyeColor--------------------------------------------------------
HairEyeColor

## ----HairEye, warning = FALSE--------------------------------------------
library(corregp)
data(HairEye)
summary(HairEye)
ftable(HairEye, col.vars = "Eye")

## ----CRG-----------------------------------------------------------------
set.seed(12345)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
summary(haireye.crg)

## ----AgPlot, fig.align = 'center', out.width = '70%', echo = FALSE-------
agplot(haireye.crg, axes = 1:2)

## ----SumCi---------------------------------------------------------------
summary(haireye.crg, add_ci = TRUE)

## ----Scree, fig.align = 'center', out.width = '65%'----------------------
screeplot(haireye.crg, add_ci = TRUE)

## ----Biplot, fig.align = 'center', out.width = '65%'---------------------
plot(haireye.crg, x_ell = TRUE, xsub = c("Hair", "Sex"))

## ----Anova1--------------------------------------------------------------
anova(haireye.crg)

## ----Anova2--------------------------------------------------------------
anova(haireye.crg, nf = 2)

## ----Ci1, fig.align = 'center', out.width = '65%'------------------------
ciplot(haireye.crg, parm = "y", axis = 1)

## ----Ci2, fig.align = 'center', out.width = '65%'------------------------
ciplot(haireye.crg, parm = c("Hair", "Sex"), axis = 1)

## ----TriCode, eval = FALSE-----------------------------------------------
#  plot3d(haireye.crg, x_ell = TRUE, xsub = c("Hair", "Sex"))

## ----TriPlot, include = FALSE, eval = FALSE------------------------------
#  par3d(viewport = c(-128, -128, 512, 512), zoom = 1.5)
#  plot3d(haireye.crg, x_ell = TRUE, xsub = c("Hair", "Sex"))
#  snapshot3d("Tri.png")

## ----PCplot, fig.align = 'center', out.width = '65%'---------------------
pcplot(haireye.crg, parm = "y", axes = 1:3)

## ----AgCode, eval = FALSE------------------------------------------------
#  agplot(haireye.crg, axes = 1:2)

## ----Contrib1------------------------------------------------------------
summary(haireye.crg, parm = "y", contrib = "axes2pnts", nf = 2)

## ----Contrib2------------------------------------------------------------
summary(haireye.crg, parm = "x", contrib = "pts_axs", nf = 2)

## ----OutCRG--------------------------------------------------------------
is.list(haireye.crg)
names(haireye.crg)
haireye.crg$y

## ----SubChr, fig.align = 'center', out.width = '65%', size = 'footnotesize'----
plot(haireye.crg, x_ell = TRUE, xsub = c("Blond", "Female", "Blond.Female"))

## ----SubNum, fig.align = 'center', out.width = '65%', size = 'footnotesize'----
plot(haireye.crg, x_ell = TRUE, xsub = c(1, 2), ysub = c(1, 2))

## ----Cint----------------------------------------------------------------
cint(haireye.crg, parm = "y", axis = 1)

## ----Coef----------------------------------------------------------------
coef(haireye.crg, parm = c("Hair", "Sex"), axes = 1:2)

## ----Fitted--------------------------------------------------------------
fitted(haireye.crg, parm = c("Hair", "Sex"), nf = 2)

## ----Resid---------------------------------------------------------------
resid(haireye.crg, parm = c("Hair", "Sex"), nf = 2)

