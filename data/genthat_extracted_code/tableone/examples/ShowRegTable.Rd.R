library(tableone)


### Name: ShowRegTable
### Title: Format regression results in medically decent format
### Aliases: ShowRegTable

### ** Examples


## Load
library(tableone)

## Load Mayo Clinic Primary Biliary Cirrhosis Data
library(survival)
data(pbc)
## Check variables
head(pbc)

## Fit a Cox regression model
objCoxph <- coxph(formula = Surv(time, status == 2) ~ trt + age + albumin + ascites,
                  data    = pbc)

## Show the simple table
ShowRegTable(objCoxph)

## Show with quote to ease copy and paste
ShowRegTable(objCoxph, quote = TRUE)




