## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(dominanceanalysis)
data("tropicbird")

## ------------------------------------------------------------------------
str(tropicbird)

## ------------------------------------------------------------------------
library(caTools)
set.seed(101) 
sample <- caTools::sample.split(tropicbird$ID, SplitRatio = .70)
train <- subset(tropicbird, sample == TRUE)
test  <- subset(tropicbird, sample == FALSE)

## ------------------------------------------------------------------------
modpres <- glm(pres~rem+land+alt+slo+rain+coast, data=train, family=binomial(link='logit'))

## ------------------------------------------------------------------------
summary(modpres)

## ------------------------------------------------------------------------
anova(modpres, test="Chisq")

## ------------------------------------------------------------------------
library(pscl)
pR2(modpres)

## ------------------------------------------------------------------------
da.glm.fit()("names")

## ------------------------------------------------------------------------
dapres<-dominanceAnalysis(modpres)

## ------------------------------------------------------------------------
getFits(dapres,"r2.m")

## ------------------------------------------------------------------------
dominanceMatrix(dapres, type="complete",fit.functions = "r2.m" )

## ------------------------------------------------------------------------
contributionByLevel(dapres,fit.functions="r2.m")

## ------------------------------------------------------------------------
dominanceMatrix(dapres, type="conditional",fit.functions = "r2.m")

## ------------------------------------------------------------------------
averageContribution(dapres,fit.functions = "r2.m")

## ------------------------------------------------------------------------
dominanceMatrix(dapres, type="general",fit.functions = "r2.m")

## ----eval=FALSE----------------------------------------------------------
#  bootmodpres100 <- bootDominanceAnalysis(modpres, R=100)
#  summary(bootmodpres100,fit.functions="r2.m")

## ---- echo=FALSE---------------------------------------------------------
summary(readRDS(system.file("extdata", "bootmodpres100.rds", package = "dominanceanalysis")),fit.functions="r2.m")

## ----eval=FALSE----------------------------------------------------------
#  bootavemodpres100<-bootAverageDominanceAnalysis(modpres,R=100)
#  summary(bootavemodpres100,fit.functions=c("r2.m"))

## ---- echo=FALSE---------------------------------------------------------
summary(readRDS(system.file("extdata", "bootavemodpres100.rds", package = "dominanceanalysis")),fit.functions="r2.m")

