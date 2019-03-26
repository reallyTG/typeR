## ----load R package, echo=TRUE-------------------------------------------
library(gscounts)

## ---- echo=TRUE----------------------------------------------------------
out <- design_gsnb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, 
                   ratio_H0 = 1, power = 0.8, sig_level = 0.025, 
                   timing = c(0.4, 0.7, 1), esf = obrien, study_period = 4, 
                   accrual_period = 1.25, random_ratio = 1)
out

## ---- echo=FALSE---------------------------------------------------------
str(out)

## ---- echo=TRUE----------------------------------------------------------
out2 <- design_gsnb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, 
                    ratio_H0 = 1, power = 0.8, sig_level = 0.025, 
                    timing = c(0.4, 0.7, 1), esf = obrien, study_period = 4, 
                    accrual_period = 1.25, random_ratio = 1, 
                    futility = "binding", esf_futility = obrien)
out2


## ---- results='hold'-----------------------------------------------------
out3 <- design_gsnb(rate1 = 4.2, rate2 = 8.4, dispersion = 3, ratio_H0 = 1, 
                   power = 0.8, sig_level = 0.025, timing = c(0.5, 1), 
                   esf = pocock, followup_max = 0.5, random_ratio = 1)
out3$n
out3$n1
out3$n2

## ---- results='hold'-----------------------------------------------------
out4 <- design_gsnb(rate1 = 4.2, rate2 = 8.4, dispersion = 3, ratio_H0 = 1, 
                   power = 0.8, sig_level = 0.025, timing = c(0.5, 1), 
                   esf = pocock, followup_max = 0.5, random_ratio = 2,
                   futility = "nonbinding", esf_futility = obrien)
out4$n
out4$n1
out4$n2

## ------------------------------------------------------------------------
recruit <- seq(0, 1.25, length.out = 1042)
out5 <- design_gsnb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, 
                   power = 0.8, timing = c(0.5, 1), esf = obrien,
                   ratio_H0 = 1, sig_level = 0.025, 
                   t_recruit1 = recruit, t_recruit2 = recruit)
out5$study_period

## ---- results='hold'-----------------------------------------------------
out6 <- design_gsnb(rate1 = 4.2, rate2 = 8.4, dispersion = 3, ratio_H0 = 1, 
                   power = 0.8, sig_level = 0.025, timing = c(0.5, 1), 
                   esf = obrien, followup_max = 1, random_ratio = 1)
out6$n1
out6$n2

## ----hospitalizations----------------------------------------------------
head(hospitalizations, n = 10)

## ----info-monitoring, results='hide', message=FALSE----------------------
library(dplyr)
# Filter data to obtain all the events which happened prior to t = 1.2906
t <- 1.2972
rawdata_interim <- dplyr::filter(hospitalizations, t_recruit <= t, 
                       (is.na(eventtime) | eventtime <= t))
# Calculate the number of events of every patient until t
events_interim <- rawdata_interim %>% 
  group_by(treatment, pat, t_recruit) %>% 
  summarise(count = sum(eventtime <= t, na.rm = TRUE)) 
# Exposure time = time of patient with study
events_interim$t_expose <- t - events_interim$t_recruit
# Negative binomial regression
glm_out <- MASS::glm.nb(formula = count ~ treatment + offset(log(t_expose)) - 1, 
                        data = events_interim)
rates <- exp(glm_out$coefficients)
followup1 <- dplyr::filter(events_interim, treatment == 'experiment')$t_expose
followup2 <- dplyr::filter(events_interim, treatment == 'control')$t_expose
# Information level at calendar time t
info_interim <- get_info_gsnb(rate1 = rates["treatmentexperiment"],
                              rate2 = rates["treatmentcontrol"],
                              dispersion = 1/glm_out$theta, 
                              followup1 = followup1, 
                              followup2 = followup2)


## ------------------------------------------------------------------------
glm_interim1 <- MASS::glm.nb(formula = count ~ treatment + offset(log(t_expose)), 
                        data = events_interim)
summary(glm_interim1)$coefficients

## ----fixed_design, echo=TRUE---------------------------------------------
out_fix <- design_nb(rate1 = 0.0875, rate2 = 0.125, dispersion = 5, 
                 ratio_H0 = 1, power = 0.8, sig_level = 0.025, 
                 study_period = 4, accrual_period = 1.25, random_ratio = 1)
out_fix

## ----nb_stucture---------------------------------------------------------
str(out_fix)

