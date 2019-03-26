library(ordcrm)


### Name: nextdose
### Title: Estimates the updated model and next dose to be tested for the
###   Proportional Odds Model (POM), Continuation Ratio (CR) Model CRM, or
###   binary 2-parameter logistic model CRM.
### Aliases: nextdose

### ** Examples

#Pseudodata toxicity grades#
initial.cr.y1 <- c(rep(0, 45), rep(1, 36), rep(2, 9), rep(3, 8), rep(4, 2),
                   rep(0, 24), rep(1, 31), rep(2, 15), rep(3, 26), rep(4, 4),
                   rep(0, 14), rep(1, 23), rep(2, 13), rep(3, 40), rep(4, 10),
                   rep(0, 1), rep(1, 4), rep(2, 5), rep(3, 35), rep(4, 55))

#Pseudodata dose levels#
initial.cr.d1 <- c(rep(200, 100), rep(934, 100), rep(1467, 100), rep(3000, 100))

#Pseudodata toxicity grades if combining grades 0 and 1 into 1 category#
combine.cr.y1 <- c(rep(0, 81), rep(1, 9), rep(2, 8), rep(3, 2),
                   rep(0, 55), rep(1, 15), rep(2, 26), rep(3, 4),
                   rep(0, 37), rep(1, 13), rep(2, 40), rep(3, 10),
                   rep(0, 5), rep(1, 5), rep(2, 35), rep(3, 55))

#6 patients already treated at doses 1060 and 800 respectively
#CR model assumption

#Example 1
nextdose(design='CR', pseudotox = initial.cr.y1, pseudodose = initial.cr.d1, cohortsize =,
         collectedtox = c(1, 4, 2, 0, 0, 1), collecteddose = c(1060, 1060, 1060, 800, 800, 800),
         targetDLT = 0.30, pseudoweights = 3, discrete = FALSE, discretedoses = NA,
         combine01 = FALSE, lowerlimitrule = 500)

#Example 2
#Discrete doses and combining grades 0 and 1
nextdose(design='CR', pseudotox = combine.cr.y1, pseudodose = initial.cr.d1, cohortsize =,
        collectedtox = c(1, 3, 2, 0, 0, 1), collecteddose = c(1060, 1060, 1060, 800, 800, 800),
        targetDLT = 0.30, pseudoweights = 3, discrete = TRUE,
        discretedoses = c(200, 500, 100, 1200, 1500, 1800), combine01 = TRUE,
        lowerlimitrule = 500)



