## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, warning = FALSE, message = FALSE,
                      fig.height = 5, fig.width = 10,
                      dpi = 200)

library(knitr)
library(cr17)
library(dplyr)

## ---- echo = FALSE-------------------------------------------------------
sampleTable <- data.frame('Patient' = numeric(5),
                          'Time' = numeric(5),
                          'Status' = numeric(5))

sampleTable$Patient <- 1:5
sampleTable$Time <- c(5,1,4,5,2)
sampleTable$Status <- c(1,0,1,2,2)

kable(sampleTable)

## ------------------------------------------------------------------------
survivalCurves <- fitSurvival(time = LUAD$time,
                              risk = LUAD$event, 
                              group = LUAD$gender,
                              cens = "alive")

## ------------------------------------------------------------------------
names(survivalCurves)

## ------------------------------------------------------------------------
SC <- survivalCurves$death[c("time", 
                       "n.risk", 
                       "n.event", 
                       "n.censor", 
                       "surv", 
                       "strata",
                       "std.err",
                       "lower",
                       "upper")]

SC <- as.data.frame(SC)
SC <- filter(SC, strata == "male")

kable(head(SC, n = 10))

## ---- out.width=700, fig.align='center'----------------------------------
plotSurvival(fit = survivalCurves,
             target = 1500,
             ggtheme = theme_gray(),
             legendtitle = "Gender")

## ------------------------------------------------------------------------
testSurvival(time = LUAD$time, 
             risk = LUAD$event, 
             group = LUAD$gender, 
             cens = "alive", 
             rho = 0)

## ------------------------------------------------------------------------
coxModel <- fitCox(time = LUAD$time,
              risk = LUAD$event,
              group = LUAD$gender,
              cens = "alive",
              conf.int = 0.95)

## ------------------------------------------------------------------------
names(coxModel)

## ------------------------------------------------------------------------
coxModel$death$coefficients

## ------------------------------------------------------------------------
kable(testCox(fitCox = coxModel))

## ------------------------------------------------------------------------
cuminc <- fitCuminc(time = LUAD$time,
                    risk = LUAD$event,
                    group = LUAD$gender,
                    cens = "alive")

## ------------------------------------------------------------------------
names(cuminc)

## ------------------------------------------------------------------------
femaleDeathCuminc <- cuminc[["female death"]]

femaleDeathCuminc <- as.data.frame(femaleDeathCuminc)

kable(head(femaleDeathCuminc))

## ---- out.width=700, fig.align='center'----------------------------------
plotCuminc(ci = cuminc,
           cens = "alive",
           target = 1500,
           ggtheme = theme_gray(),
           legendtitle = "Gender")


## ------------------------------------------------------------------------
testCuminc(cuminc) 

## ------------------------------------------------------------------------
reg <- fitReg(time = LUAD$time,
              risk = LUAD$event,
              group = LUAD$gender,
              cens = "alive")

## ------------------------------------------------------------------------
reg$death$coef

## ------------------------------------------------------------------------
testReg(reg)

## ---- eval=FALSE---------------------------------------------------------
#  riskTab(time = LUAD$time,
#          risk = LUAD$event,
#          group = LUAD$gender,
#          cens = "alive",
#          title = "Number at risk")
#  

## ---- eval=FALSE---------------------------------------------------------
#  eventTab(time = LUAD$time,
#          risk = LUAD$event,
#          group = LUAD$gender,
#          cens = "alive",
#          title = "Number of events")
#  

## ---- eval = FALSE-------------------------------------------------------
#  summarizeCR(time = LUAD$time,
#              risk = LUAD$event,
#              group = LUAD$gender, cens = "alive")

## ---- eval = FALSE-------------------------------------------------------
#  summarizeCR(time = LUAD$time,
#              risk = LUAD$event,
#              group = LUAD$gender,
#              cens = "alive",
#              rho = 1,
#              target = 800,
#              type = "kaplan-meier",
#              ggtheme = theme_gray(),
#              titleSurv = "Survival analysis",
#              titleCuminc = "Competing risks models",
#              xtitle = "Days",
#              ytitleSurv = "Survival curves",
#              ytitleCuminc = "Cumulative incidence functions",
#              legendtitle = "Gender")

