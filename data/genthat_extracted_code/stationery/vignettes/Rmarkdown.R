## ----setup, include=FALSE-------------------------------------------
##This Invisible Chunk is required in all CRMDA documents
outdir <- paste0("tmpout")
if (!file.exists(outdir)) dir.create(outdir, recursive = TRUE)
knitr::opts_chunk$set(echo=TRUE,
          comment=NA, fig.path=paste0(outdir, "/p-"))
options(width = 70)

## ----themecopy, include = FALSE-------------------------------------
## not needed b/c this vignette has custom files in theme folder
library(stationery)
files1 <- c("logo.pdf", "report-template.tex", "R.bib")
getFiles(files1, pkg = "stationery")
files2 <- c("guide-template.tex")
getFiles(files2, pkg = "stationery")

## ----fakedata, include=F--------------------------------------------
library(rockchalk)
dat <- genCorrelatedData2(N = 1000, rho = c(0.1, 0.2, 0.7),
                          beta = c(1, 1.0, -1.1, 0.1, 0.1, 0.1, 0, 0.1), stde = 1)

## ----reg10, echo=T, results="hide"----------------------------------
m1 <- lm(y ~ x1 + x2 + x3, data = dat)
m2 <- lm(y ~ x1 + x2*x3 + x1*x3, data = dat)


## ----reg20, echo=F, results="asis"----------------------------------
varLab <- c(y = "Cancer", x1 = "Plutonium", x2 = "Veggies",
            x3 = "Tobacco", `x2:x3` = "Veg $\\times$ Tob",
            `x1:x3` = "Plut $\\times$ Tob")
or10 <- outreg(list("Cancer OLS" = m1, "Cancer Interaction" = m2),
               tight=FALSE, varLab = varLab)

## ----reg30----------------------------------------------------------
cat(or10, file = "tmpout/or10file.tex")

## ----session--------------------------------------------------------
warnings()
sessionInfo()

