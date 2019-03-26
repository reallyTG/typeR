## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", warning = FALSE, message = FALSE,
                      fig.height = 5, fig.width = 10)

## ------------------------------------------------------------------------
library(factorMerger)
library(survival)

## ------------------------------------------------------------------------
if (!require("forcats")) {
    install.packages("forcats")
}
library(forcats)


## ------------------------------------------------------------------------
data("BRCA")

## ------------------------------------------------------------------------
brcaSurv <- Surv(time = BRCA$time, event = BRCA$vitalStatus)

## ------------------------------------------------------------------------
drugName <- BRCA$drugName # drug name
drugName <- fct_lump(as.factor(drugName), prop = 0.05) 


## ------------------------------------------------------------------------
drugNameFM <- mergeFactors(response = brcaSurv[!is.na(drugName)], 
                           factor = drugName[!is.na(drugName)], 
                           family = "survival")

plot(drugNameFM, nodesSpacing = "effects", gicPanelColor = "grey2")

## ------------------------------------------------------------------------
anova(coxph(brcaSurv[!is.na(drugName)] ~ drugName[!is.na(drugName)]))
anova(coxph(brcaSurv[!is.na(drugName)] ~ cutTree(drugNameFM)))

## ------------------------------------------------------------------------
subtype <- BRCA$histologicalType
subtype <- fct_lump(as.factor(subtype), prop = 0.05) 

subtypeFM <- mergeFactors(response = brcaSurv[!is.na(subtype)], 
                          factor = subtype[!is.na(subtype)],
                           family = "survival")

plot(subtypeFM) 

## ------------------------------------------------------------------------
patCat <- BRCA$pathologicCategory %>% substr(1, 2)

patCatFM <- mergeFactors(response = brcaSurv[!is.na(patCat)],
                         factor = patCat[!is.na(patCat)],
                         family = "survival")

plot(patCatFM, responsePanel = "frequency", gicPanelColor = "red")

## ------------------------------------------------------------------------
anova(coxph(brcaSurv[!is.na(patCat)] ~ patCat[!is.na(patCat)]))
anova(coxph(brcaSurv[!is.na(subtype)] ~ cutTree(subtypeFM)))

