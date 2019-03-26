## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(furniture)
library(MarginalMediation)

## ------------------------------------------------------------------------
library(furniture)
data("nhanes_2010")
names(nhanes_2010)

## ------------------------------------------------------------------------
pathbc = glm(marijuana ~ home_meals + gender + age + asthma, 
           data = nhanes_2010, 
           family = "binomial")
patha = glm(home_meals ~ gender + age + asthma,
           data = nhanes_2010, 
           family = "gaussian")
mma(pathbc, patha,
    ind_effects = c("genderFemale-home_meals",
                    "age-home_meals",
                    "asthmaNo-home_meals"),
    boot = 500)

## ------------------------------------------------------------------------
frames(pathbc,
       boot = 100)

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("leeper/margins")
#  library(margins)
#  summary(margins(pathbc))

