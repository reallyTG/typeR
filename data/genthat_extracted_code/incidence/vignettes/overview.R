## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width=7, 
  fig.height=5
)

## ----install, eval=FALSE-------------------------------------------------
#  install.packages("incidence")

## ----install2, eval=FALSE------------------------------------------------
#  devtools::install_github("reconhub/incidence")

## ---- data---------------------------------------------------------------
library(outbreaks)
library(ggplot2)
library(incidence)

dat <- ebola_sim$linelist$date_of_onset
class(dat)
head(dat)

## ---- incid1-------------------------------------------------------------
i <- incidence(dat)
i
plot(i)

## ---- interv-------------------------------------------------------------
## weekly
i.7 <- incidence(dat, interval=7)
plot(i.7)

## bi-weekly
i.14 <- incidence(dat, interval=14)
plot(i.14, border = "white")

## monthly
i.month <- incidence(dat, interval="month")
plot(i.month, border = "white")


## ---- gender-------------------------------------------------------------
i.7.sex <- incidence(dat, interval = 7, groups = ebola_sim$linelist$gender)
i.7.sex
plot(i.7.sex, stack = TRUE, border = "grey")

## ---- hosp---------------------------------------------------------------
i.7.hosp <- with(ebola_sim_clean$linelist, 
	 incidence(date_of_onset, interval=7, groups = hospital))
i.7.hosp
head(i.7.hosp$counts)
plot(i.7.hosp, stack=TRUE) + 
    theme(legend.position= "top") + 
    labs(fill="")

## ---- middle-------------------------------------------------------------
i[100:250]
plot(i[100:250])

## ---- stripes------------------------------------------------------------
i.7[c(TRUE,FALSE)]
plot(i.7[c(TRUE,FALSE)])

## ---- tail---------------------------------------------------------------
i.tail <- subset(i, from=as.Date("2015-01-01"))
i.tail
plot(i.tail, border="white")

## ---- i7outcome----------------------------------------------------------
i.7.outcome <- incidence(dat, 7, groups=ebola_sim$linelist$outcome)
i.7.outcome
plot(i.7.outcome, stack = TRUE, border = "grey")

## ---- groupsub-----------------------------------------------------------
i.7.outcome[,1:2]
plot(i.7.outcome[,1:2], stack = TRUE, border = "grey")

## ---- pool---------------------------------------------------------------
i.pooled <- pool(i.7.outcome)
i.pooled
identical(i.7$counts, i.pooled$counts)

## ---- fit1---------------------------------------------------------------
plot(i.7[1:20])
early.fit <- fit(i.7[1:20])
early.fit

## ------------------------------------------------------------------------
plot(early.fit)

## ------------------------------------------------------------------------
plot(i.7[1:20], fit = early.fit)

## ---- fit.both-----------------------------------------------------------
fit.both <- fit(i.7, split=as.Date("2014-10-15"))
fit.both
plot(i.7, fit=fit.both)

## ---- optim--------------------------------------------------------------
best.fit <- fit_optim_split(i.7)
best.fit
plot(i.7, fit=best.fit$fit)

## ---- get_info-----------------------------------------------------------
get_info(best.fit$fit, "doubling")      # doubling time
get_info(best.fit$fit, "doubling.conf") # confidence interval
get_info(best.fit$fit, "halving")       
get_info(best.fit$fit, "halving.conf")       

## ---- optim2-------------------------------------------------------------
best.fit2 <- fit_optim_split(i.7.sex)
best.fit2
plot(i.7.sex, fit=best.fit2$fit)

## ---- get_info_groups----------------------------------------------------
get_info(best.fit2$fit, "doubling")      # doubling time
get_info(best.fit2$fit, "doubling.conf") # confidence interval
get_info(best.fit2$fit, "halving")       
get_info(best.fit2$fit, "halving.conf")       

