## ----load, echo=F--------------------------------------------------------
library(microsynth)
library(knitr)
knitr::opts_chunk$set(message = FALSE, warning = FALSE, fig.height=3.1, fig.width=7.2, fig.show = "hold")
# load("../objects_for_vignettes.Rdata")

## ----ex0_load------------------------------------------------------------
colnames(seattledmi)
set.seed(99199)

## ----ex0_variables-------------------------------------------------------
cov.var <- c("TotalPop", "BLACK", "HISPANIC", "Males_1521", "HOUSEHOLDS", 
             "FAMILYHOUS", "FEMALE_HOU", "RENTER_HOU", "VACANT_HOU")
match.out <- c("i_felony", "i_misdemea", "i_drugs", "any_crime")

## ----ex1, eval = TRUE, echo=TRUE-----------------------------------------
sea1 <- microsynth(seattledmi, 
                   idvar="ID", timevar="time", intvar="Intervention", 
                   start.pre=1, end.pre=12, end.post=16, 
                   match.out=match.out, match.covar=cov.var, 
                   result.var=match.out, omnibus.var=match.out, plot.var=match.out,
                   test="lower", sep = TRUE)

## ----ex1b, eval = TRUE---------------------------------------------------
summary(sea1)

## ----ex2, eval = FALSE, echo=TRUE----------------------------------------
#  sea2 <- microsynth(seattledmi,
#                     idvar="ID", timevar="time", intvar="Intervention",
#                     start.pre=1, end.pre=12, end.post=c(14, 16),
#                     match.out=match.out, match.covar=cov.var,
#                     result.var=match.out, omnibus.var=match.out,
#                     plot.var=match.out,
#                     test="lower",
#                     perm=250, jack=TRUE, sep = TRUE)

## ---- eval = TRUE, echo = FALSE------------------------------------------
a <- readRDS("../inst/extdata/sea2micro.rds")
summary(a)

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea2-min.png")

## ----ex3_vars------------------------------------------------------------
match.out <- c("i_robbery", "i_aggassau", "i_burglary", "i_larceny", "i_felony", 
               "i_misdemea", "i_drugsale", "i_drugposs", "any_crime")

## ----ex3, eval = FALSE, echo=TRUE----------------------------------------
#  sea3 <- microsynth(seattledmi,
#                     idvar="ID", timevar="time", intvar="Intervention",
#                     end.pre=12,
#                     match.out=match.out, match.covar=cov.var,
#                     result.var=match.out, plot.var=match.out,
#                     perm=250, jack=0,
#                     test="lower", check.feas=TRUE, use.backup = TRUE)

## ---- eval = TRUE, echo = FALSE------------------------------------------
sea3m <- readRDS("../inst/extdata/sea3micro.rds")
summary(sea3m)

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea3a-min.png")

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea3b-min.png")

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea3c-min.png")

## ----ex4, eval = FALSE, echo=TRUE----------------------------------------
#  match.out <- list( 'i_robbery'=rep(2, 6),
#                     'i_aggassau'=rep(2, 6),
#                     'i_burglary'=rep(1, 12),
#                     'i_larceny'=rep(1, 12),
#                     'i_felony'=rep(2, 6),
#                     'i_misdemea'=rep(2, 6),
#                     'i_drugsale'=rep(4, 3),
#                     'i_drugposs'=rep(4, 3),
#                     'any_crime'=rep(1, 12))
#  
#  sea4 <- microsynth(seattledmi,
#                     idvar="ID", timevar="time",intvar="Intervention",
#                     match.out=match.out, match.covar=cov.var,
#                     result.var=names(match.out), omnibus.var=names(match.out),
#                     plot.var=names(match.out),
#                     end.pre=12,
#                     perm=250, jack = TRUE,
#                     test="lower",
#                     plot.file="ExPlots4.pdf", result.file="ExResults4.xlsx")

## ---- eval = TRUE, echo = FALSE------------------------------------------
sea4m <- readRDS("../inst/extdata/sea4micro.rds")
summary(sea4m)

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea4a-min.png")

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea4b-min.png")

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea4c-min.png")

## ----ex5, eval = FALSE, echo=TRUE, results='hide'------------------------
#  match.out <- c("i_felony", "i_misdemea", "i_drugs", "any_crime")
#  
#  sea5 <- microsynth(seattledmi,
#                     idvar="ID", timevar="time",intvar="Intervention",
#                     end.pre=12,
#                     match.out=match.out, match.covar=cov.var,
#                     result.var=FALSE, plot.var=FALSE,
#                     perm=250, jack=TRUE)

## ---- eval = TRUE, echo = FALSE------------------------------------------
sea5m <- readRDS("../inst/extdata/sea5micro.rds")
summary(sea5m)

## ----ex6, eval = FALSE, echo=TRUE----------------------------------------
#  sea6 <- microsynth(seattledmi,
#                     idvar="ID", timevar="time", intvar="Intervention",
#                     end.pre=12,
#                     result.var=FALSE, plot.var=match.out[1:2],
#                     w=sea5$w)

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea6c-min.png")

## ----ex7, eval = FALSE, echo=TRUE----------------------------------------
#  sea7 <- microsynth(seattledmi,
#                     idvar="ID", timevar="time", intvar="Intervention",
#                     end.pre=12, end.post=c(14, 16),
#                     result.var=match.out, plot.var=FALSE,
#                     test="lower",
#                     w=sea5$w)

## ---- eval = TRUE, echo = FALSE------------------------------------------
sea7m <- readRDS("../inst/extdata/sea7micro.rds")
sea7m

## ----ex8prep, eval = FALSE, echo=TRUE------------------------------------
#  set.seed(86872)
#  ids.t <- names(table(seattledmi$ID[seattledmi$Intervention==1]))
#  ids.c <- names(table(seattledmi$ID[seattledmi$Intervention==0]))
#  ids.synth <- c(sample(ids.t, 1), sample(ids.c, 100))
#  seattledmi.one <- seattledmi[is.element(seattledmi$ID, as.numeric(ids.synth)), ]

## ----ex8, eval = FALSE, echo=TRUE----------------------------------------
#  sea8 <- microsynth(seattledmi.one,
#                     idvar="ID", timevar="time", intvar="Intervention",
#                     match.out=match.out[4], match.covar=cov.var,
#                     result.var=match.out[4], plot.var=match.out[4],
#                     test="lower", perm=250, jack=FALSE,
#                     check.feas=TRUE, use.backup=TRUE)

## ---- eval = TRUE, echo = FALSE------------------------------------------
sea8m <- readRDS("../inst/extdata/sea8micro.rds")
summary(sea8m)

## ----out.width = "100%", echo=F------------------------------------------
knitr::include_graphics("../inst/extdata/sea8-min.png")

## ----ex9, eval = FALSE, echo=TRUE----------------------------------------
#  seattledmi.cross <- seattledmi[seattledmi$time==16, colnames(seattledmi)!="time"]

## ----ex9results, eval = FALSE, echo=TRUE---------------------------------
#  sea9 <- microsynth(seattledmi.cross,
#                     idvar="ID", intvar="Intervention",
#                     match.out=FALSE, match.covar=cov.var,
#                     result.var=match.out,
#                     test="lower",
#                     perm=1, jack=F)

## ---- eval = TRUE, echo = FALSE------------------------------------------
sea9m <- readRDS("../inst/extdata/sea9micro.rds")
sea9m

