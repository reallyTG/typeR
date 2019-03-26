## ---- echo=FALSE, hide = TRUE--------------------------------------------
load("vignette_out.RData")

## ----package-download-cran, tidy = TRUE, eval=FALSE----------------------
#  install.packages("rptR")

## ----package-download-github, tidy = TRUE, eval=FALSE--------------------
#  install.packages("devtools")
#  devtools::install_github("mastoffel/rptR", build_vignettes = TRUE)

## ----package-loading, tidy = TRUE, results='hide'------------------------
library(rptR)

## ----citation, tidy = TRUE, results='hide'-------------------------------
citation("rptR")

## ----data-preparation-gaussian, tidy = TRUE, fig.width=7, fig.height=3----
data(BeetlesBody)
str(BeetlesBody)
hist(BeetlesBody$BodyL)
table(BeetlesBody$Population)

## ----gaussian-reduced-boot, tidy = TRUE----------------------------------
rpt(BodyL ~ (1|Population),  grname="Population", data=BeetlesBody, datatype="Gaussian", nboot=0, npermut=0)

## ----gaussian-full-boot, tidy = TRUE, eval = FALSE-----------------------
#  rep1 <- rpt(BodyL ~ (1|Population),  grname="Population", data=BeetlesBody, datatype="Gaussian", nboot=1000, npermut=0)

## ----gaussian-full-boot-update, tidy = TRUE, eval = FALSE----------------
#  rep1 <- rpt(BodyL ~ (1|Population),  grname="Population", data=BeetlesBody, datatype="Gaussian", nboot=500, npermut=0, update=TRUE, rptObj=rep1)

## ----gaussian-print, tidy = TRUE, fig.width=7, fig.height=4--------------
print(rep1)
summary(rep1)
plot(rep1, cex.main=1.0)

## ----gaussian-full-boot-permut, tidy = TRUE, warning=1, eval = FALSE-----
#  rep2 <- rpt(BodyL ~ (1|Population),  grname="Population", data=BeetlesBody, datatype="Gaussian", nboot=0, npermut=1000)

## ----gaussian-plot-permut, tidy = TRUE, fig.width=7, fig.height=4--------
plot(rep2, type="permut", cex.main=1.0)

## ----gaussian-str, tidy = TRUE, results='hide'---------------------------
str(rep2)
# Output omitted

## ----gaussian-show-model-------------------------------------------------
summary(rep2$mod)

## ----gaussian-multiple-randeff, tidy = TRUE, eval = FALSE----------------
#  rep3 <- rpt(BodyL ~ (1|Container) + (1|Population),  grname=c("Container", "Population"), data=BeetlesBody, datatype="Gaussian", nboot=1000, npermut=0)

## ----gaussian-multiple-randeff-print, tidy = TRUE------------------------
print(rep3)

## ----gaussian-multiple-randeff-plot, tidy = TRUE, fig.show='hold', fig.width=3.2----
plot(rep3, grname="Container", type="boot", cex.main=0.8)
plot(rep3, grname="Population", type="boot", cex.main=0.8)

## ----gaussian-containeronly-randeff, tidy = TRUE, eval = FALSE-----------
#  rep4 <- rpt(BodyL ~ (1|Container),  grname="Container", data=BeetlesBody, datatype="Gaussian", nboot=1000, npermut=0)

## ----gaussian-containeronly-randeff-print, tidy = TRUE, eval = TRUE------
print(rep4)

## ----gaussian-adjusted, tidy = TRUE, eval = FALSE------------------------
#  rep5 <- rpt(BodyL ~ Treatment + Sex + (1|Container) + (1|Population),  grname=c("Container", "Population"), data=BeetlesBody, datatype="Gaussian", nboot=1000, npermut=0)

## ----gaussian-adjusted-plot, tidy = TRUE, fig.show='hold', fig.width=3.2----
print(rep5)
plot(rep5, type="boot", grname="Container", cex.main=0.8)
plot(rep5, type="boot", grname="Population", cex.main=0.8)

## ----gaussian-enhanced-agreement, tidy = TRUE, eval = FALSE--------------
#  rep6 <- rpt(BodyL ~ Treatment + Sex + (1|Container) + (1|Population),  grname=c("Container", "Population"), data=BeetlesBody, datatype="Gaussian", nboot=1000, npermut=0, adjusted=FALSE)

## ----gaussian-enhanced-agreement-print, tidy = TRUE----------------------
print(rep6)

## ----gaussian-r2, tidy = TRUE, eval = FALSE------------------------------
#  rep7 <- rpt(BodyL ~ Treatment + Sex + (1|Container) + (1|Population),  grname=c("Container", "Population", "Fixed"), data=BeetlesBody, datatype="Gaussian", nboot=1000, npermut=0, adjusted=FALSE)

## ----gaussian-r2-plot, tidy = TRUE, fig.width=7, fig.height=4, eval = TRUE----
print(rep7)
plot(rep7, grname="Fixed", type="boot")

## ----data-loading-poisson, tidy = TRUE, fig.width=7----------------------
data(BeetlesFemale)
hist(BeetlesFemale$Egg, nclass=max(BeetlesFemale$Egg))

## ----poisson-model, tidy = TRUE, warning=1, eval = FALSE-----------------
#  rep8 <- rpt(Egg ~ Treatment + (1|Container) + (1|Population),  grname=c("Container", "Population"),  data=BeetlesFemale, datatype="Poisson", nboot=1000, npermut=0)

## ----poisson-model-print-------------------------------------------------
print(rep8)

## ----poisson-model-plot, tidy = TRUE, fig.width=3.2, fig.show="hold"-----
plot(rep8, grname="Container", scale="link", cex.main=0.8)
plot(rep8, grname="Population", scale="link", cex.main=0.8)
plot(rep8, grname="Container", scale="original", cex.main=0.8)
plot(rep8, grname="Population", scale="original", cex.main=0.8)

## ----poisson-enhanced-agreement, tidy = TRUE, eval = FALSE---------------
#  rep9 <- rpt(Egg ~ Treatment + (1|Container) + (1|Population),  grname=c("Container", "Population", "Fixed"),  data=BeetlesFemale, datatype="Poisson", nboot=1000, npermut=0, adjusted=FALSE)
#  print(rep9)

## ----poisson-enhanced-agreement-print, tidy = TRUE-----------------------
print(rep9)

## ----data-loading-binary, tidy = TRUE, fig.width=7-----------------------
data(BeetlesMale)
table(c("dark","reddish")[BeetlesMale$Colour+1])

## ----binary-model, warning=1, tidy = TRUE, fig.width=7, fig.height=4, eval = FALSE----
#  rep10 <- rpt(Colour ~ (1|Container) + (1|Population),  grname=c("Container", "Population"), data=BeetlesMale, datatype="Binary", nboot=1000, npermut=0)

## ----binary-model-print, warning=1, tidy = TRUE, fig.width=7, fig.height=4----
print(rep10)

## ----binary-enhaned-agreement, tidy = TRUE, fig.width=3.2, fig.show='hold', eval = FALSE----
#  rep11 <- rpt(Colour ~ Treatment + (1|Container) + (1|Population),  grname=c("Container", "Population", "Fixed"), data=BeetlesMale, datatype="Binary", nboot=1000, npermut=0, adjusted=FALSE)

## ----binary-enhaned-agreement-plot, tidy = TRUE, fig.width=3.2, fig.show='hold'----
print(rep11)
plot(rep11, grname="Population", scale="link", cex.main=0.8)
plot(rep11, grname="Population", scale="original", cex.main=0.8)
plot(rep11, grname="Container", scale="link", cex.main=0.8)
plot(rep11, grname="Container", scale="original", cex.main=0.8)
plot(rep11, grname="Fixed", scale="link", cex.main=0.8)
plot(rep11, grname="Fixed", scale="original", cex.main=0.8)

## ----proportion-model, warning=1, tidy = TRUE, fig.width=7, fig.height=4, eval = FALSE----
#  BeetlesMale$Dark = BeetlesMale$Colour
#  BeetlesMale$Reddish = (BeetlesMale$Colour-1)*-1
#  BeetlesMaleAggr <- aggregate(cbind(Dark, Reddish) ~ Population + Container, data=BeetlesMale, FUN=sum)
#  rep12 <- rpt(cbind(Dark, Reddish) ~ (1|Population),  grname=c("Population"), data=BeetlesMaleAggr, datatype="Proportion", nboot=1000, npermut=0)
#  print(rep12)

## ----proportion-model-print, warning=1, tidy = TRUE, fig.width=7, fig.height=4----
print(rep12)

## ----poisson-model-link comparison-1, tidy = TRUE, warning=FALSE---------
print(rep8) # log link

## ----poisson-model-link comparison-2, tidy = TRUE, warning=FALSE, eval = FALSE----
#  rep8a <- rpt(Egg ~ Treatment + (1|Container) + (1|Population),  grname=c("Container", "Population"), data=BeetlesFemale, datatype="Poisson", link="sqrt", nboot=1000, npermut=0)

## ----poisson-model-link comparison-3, tidy = TRUE, warning=FALSE---------
print(rep8a) # sqrt link

## ----biary-model-link comparison-1, tidy = TRUE, warning=FALSE-----------
print(rep10) # logit link

## ----biary-model-link comparison-2, tidy = TRUE, warning=FALSE, eval = FALSE----
#  rep10a <- rpt(Colour ~ (1|Container) + (1|Population), grname=c("Container", "Population"), data=BeetlesMale, datatype="Binary", link="probit", nboot=1000, npermut=0)

## ----biary-model-link comparison-3, tidy = TRUE, warning=FALSE-----------
print(rep10a) # probit link

## ----proportion-model-link comparison-1, tidy = TRUE, warning=FALSE------
print(rep12) # logit link

## ----proportion-model-link comparison-2, tidy = TRUE, warning=FALSE, eval = FALSE----
#  rep12a <- rpt(cbind(Dark, Reddish) ~ (1|Population),  grname=c("Population"), data=BeetlesMaleAggr, datatype="Proportion", link="probit", nboot=1000, npermut=0)

## ----proportion-model-link comparison-3, tidy = TRUE, warning=FALSE------
print(rep12a) # probit link

## ----binary-variance-model, warning=1,  tidy = TRUE, fig.show='hold', fig.width=3.2, eval = FALSE----
#  rep13 <- rpt(Egg ~ Treatment + (1|Container) + (1|Population),  grname=c("Container", "Population"), data=BeetlesFemale, datatype="Poisson", nboot=1000, npermut=0, ratio=FALSE)

## ----binary-variance-model-plot, warning=1,  tidy = TRUE, fig.show='hold', fig.width=3.2----
print(rep13)
plot(rep13, grname="Container", scale="link", cex.main=0.8)
plot(rep13, grname="Population", scale="link", cex.main=0.8)

## ----binary-residual-model, warning=1,  tidy = TRUE, fig.show='hold', fig.width=3.2, eval = FALSE----
#  rep14 <- rpt(Egg ~ Treatment + (1|Container) + (1|Population),  grname=c("Container", "Population", "Overdispersion", "Residual"), data=BeetlesFemale, datatype="Poisson", nboot=1000, npermut=0, ratio=FALSE)

## ----binary-residual-model-plot, warning=1,  tidy = TRUE, fig.show='hold', fig.width=3.2----
print(rep14)
plot(rep14, grname="Overdispersion", scale="link", cex.main=0.8)
plot(rep14, grname="Residual", scale="link", cex.main=0.8)

## ----binary-overdisperion-test, warning=1, tidy = TRUE, fig.width=7, fig.height=4, eval = FALSE----
#  rep15 <- rpt(Egg ~ Treatment + (1|Container) + (1|Population),  grname=c("Container", "Population", "Overdispersion"), data=BeetlesFemale, datatype="Poisson", nboot=0, npermut=1000, ratio=FALSE)

## ----binary-overdisperion-test-print, warning=1, tidy = TRUE, fig.width=7, fig.height=4----
print(rep15)

## ----gaussian-random-slopes, tidy = TRUE, eval = FALSE-------------------
#  rep16 <- rpt(BodyL ~ Treatment + Sex + (1|Container) + (Treatment + Sex|Population),  grname=c("Population"), data=BeetlesBody, datatype="Gaussian", nboot=500, npermut=0, adjusted=FALSE)

## ----gaussian-random-slopes-print, warning=1, tidy = TRUE, eval = TRUE----
summary(rep16)

