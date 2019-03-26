## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(jskm)

## ------------------------------------------------------------------------
#Load dataset
library(survival)
data(colon)
fit <- survfit(Surv(time,status)~rx, data=colon)

#Plot the data
jskm(fit)
jskm(fit, table = T, pval = T, label.nrisk = "No. at risk", size.label.nrisk = 8, 
     xlabs = "Time(Day)", ylabs = "Survival", ystratalabs = c("Obs", "Lev", "Lev + 5FU"), ystrataname = "rx",
     marks = F, timeby = 365, xlims = c(0, 3000), ylims = c(0.25, 1))

## ------------------------------------------------------------------------
jskm(fit, ci = T, cumhaz = T,  mark = F, ylab = "Cumulative hazard (%)", surv.scale = "percent", pval =T, pval.size = 6, pval.coord = c(300, 0.7))

## ------------------------------------------------------------------------
library(survey)
data(pbc, package="survival")
pbc$randomized <- with(pbc, !is.na(trt) & trt>0)
biasmodel <- glm(randomized~age*edema,data=pbc)
pbc$randprob <- fitted(biasmodel)

dpbc<-svydesign(id=~1, prob=~randprob, strata=~edema, data=subset(pbc,randomized))

s1 <-svykm(Surv(time,status>0) ~ 1, design = dpbc)
s2 <-svykm(Surv(time,status>0) ~ sex, design = dpbc)

svyjskm(s1)
svyjskm(s2)
svyjskm(s2, cumhaz = T, ylab = "Cumulative hazard(%)", surv.scale = "percent") 

## ------------------------------------------------------------------------
s3 <- svykm(Surv(time,status>0) ~ sex, design=dpbc, se = T)
svyjskm(s3)
svyjskm(s3, ci = F)

