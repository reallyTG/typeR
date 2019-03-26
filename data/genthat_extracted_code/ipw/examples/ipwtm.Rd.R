library(ipw)


### Name: ipwtm
### Title: Estimate Inverse Probability Weights (Time Varying)
### Aliases: ipwtm
### Keywords: htest models

### ** Examples

########################################################################
#EXAMPLE 1

#Load longitudinal data from HIV positive individuals.
data(haartdat)

#CD4 is confounder for the effect of initiation of HAART therapy on mortality.
#Estimate inverse probability weights to correct for confounding.
#Exposure allocation model is Cox proportional hazards model.
require(survival)
temp <- ipwtm(
   exposure = haartind,
   family = "survival",
   numerator = ~ sex + age,
   denominator = ~ sex + age + cd4.sqrt,
   id = patient,
   tstart = tstart,
   timevar = fuptime,
   type = "first",
   data = haartdat)

#plot inverse probability weights
graphics.off()
ipwplot(weights = temp$ipw.weights, timevar = haartdat$fuptime,
  binwidth = 100, ylim = c(-1.5, 1.5), main = "Stabilized inverse probability weights")

#CD4 count has an effect both on dropout and mortality, which causes informative censoring.
#Use inverse probability of censoring weighting to correct for effect of CD4 on dropout.
#Use Cox proportional hazards model for dropout.
temp2 <- ipwtm(
   exposure = dropout,
   family = "survival",
   numerator = ~ sex + age,
   denominator = ~ sex + age + cd4.sqrt,
   id = patient,
   tstart = tstart,
   timevar = fuptime,
   type = "first",
   data = haartdat)

#plot inverse probability of censoring weights
graphics.off()
ipwplot(weights = temp2$ipw.weights, timevar = haartdat$fuptime,
  binwidth = 100, ylim = c(-1.5, 1.5), main = "Stabilized inverse probability of censoring weights")

#MSM for the causal effect of initiation of HAART on mortality.
#Corrected both for confounding and informative censoring.
#With robust standard error obtained using cluster().
summary(coxph(Surv(tstart, fuptime, event) ~ haartind + cluster(patient),
   data = haartdat, weights = temp$ipw.weights*temp2$ipw.weights))

#uncorrected model
summary(coxph(Surv(tstart, fuptime, event) ~ haartind, data = haartdat))

########################################################################
#EXAMPLE 2

data(basdat)
data(timedat)

#Aim: to model the causal effect of active tuberculosis (TB) on mortality.
#Longitudinal CD4 is a confounder as well as intermediate for the effect of TB.

#process original measurements
   #check for ties (not allowed)
      table(duplicated(timedat[,c("id", "fuptime")]))
   #take square root of CD4 because of skewness
      timedat$cd4.sqrt <- sqrt(timedat$cd4count)
   #add TB time to dataframe
      timedat <- merge(timedat, basdat[,c("id", "Ttb")], by = "id", all.x = TRUE)
   #compute TB status
      timedat$tb.lag <- ifelse(with(timedat, !is.na(Ttb) & fuptime > Ttb), 1, 0)
   #longitudinal CD4-model
      require(nlme)
      cd4.lme <- lme(cd4.sqrt ~ fuptime + tb.lag, random = ~ fuptime | id,
      data = timedat)

#build new dataset:
#rows corresponding to TB-status switches, and individual end times
   times <- sort(unique(c(basdat$Ttb, basdat$Tend)))
   startstop <- data.frame(
      id = rep(basdat$id, each = length(times)),
      fuptime = rep(times, nrow(basdat)))
   #add baseline data to dataframe
      startstop <- merge(startstop, basdat, by = "id", all.x = TRUE)
   #limit individual follow-up using Tend
      startstop <- startstop[with(startstop, fuptime <= Tend),]
   startstop$tstart <- tstartfun(id, fuptime, startstop) #compute tstart (?tstartfun)
   #indicate TB status
      startstop$tb <- ifelse(with(startstop, !is.na(Ttb) & fuptime >= Ttb), 1, 0)
   #indicate TB status at previous time point
      startstop$tb.lag <- ifelse(with(startstop, !is.na(Ttb) & fuptime > Ttb), 1, 0)
   #indicate death
      startstop$event <- ifelse(with(startstop, !is.na(Tdeath) & fuptime >= Tdeath),
      1, 0)
   #impute CD4, based on TB status at previous time point.
      startstop$cd4.sqrt <- predict(cd4.lme, newdata = data.frame(id = startstop$id,
         fuptime = startstop$fuptime, tb.lag = startstop$tb.lag))

#compute inverse probability weights
   require(survival)
   temp <- ipwtm(
      exposure = tb,
      family = "survival",
      numerator = ~ 1,
      denominator = ~ cd4.sqrt,
      id = id,
      tstart = tstart,
      timevar = fuptime,
      type = "first",
      data = startstop)
   summary(temp$ipw.weights)
   ipwplot(weights = temp$ipw.weights, timevar = startstop$fuptime, binwidth = 100)

#models
   #IPW-fitted MSM, using cluster() to obtain robust standard error estimate
      summary(coxph(Surv(tstart, fuptime, event) ~ tb + cluster(id),
      data = startstop, weights = temp$ipw.weights))
   #unadjusted
      summary(coxph(Surv(tstart, fuptime, event) ~ tb, data = startstop))
   #adjusted using conditioning: part of the effect of TB is adjusted away
      summary(coxph(Surv(tstart, fuptime, event) ~ tb + cd4.sqrt, data = startstop))

## Not run: 
##D #compute bootstrap CI for TB parameter (takes a few hours)
##D #taking into account the uncertainty introduced by modelling longitudinal CD4
##D #taking into account the uncertainty introduced by estimating the inverse probability weights
##D #robust with regard to weights unequal to 1
##D   require(boot)
##D   boot.fun <- function(data, index, data.tm){
##D      data.samp <- data[index,]
##D      data.samp$id.samp <- 1:nrow(data.samp)
##D      data.tm.samp <- do.call("rbind", lapply(data.samp$id.samp, function(id.samp) {
##D        cbind(data.tm[data.tm$id == data.samp$id[data.samp$id.samp == id.samp],],
##D          id.samp = id.samp)
##D        }
##D      ))
##D      cd4.lme <- lme(cd4.sqrt ~ fuptime + tb.lag, random = ~ fuptime | id.samp, data = data.tm.samp)
##D      times <- sort(unique(c(data.samp$Ttb, data.samp$Tend)))
##D      startstop.samp <- data.frame(id.samp = rep(data.samp$id.samp, each = length(times)),
##D                                   fuptime = rep(times, nrow(data.samp)))
##D      startstop.samp <- merge(startstop.samp, data.samp, by = "id.samp", all.x = TRUE)
##D      startstop.samp <- startstop.samp[with(startstop.samp, fuptime <= Tend),]
##D      startstop.samp$tstart <- tstartfun(id.samp, fuptime, startstop.samp)
##D      startstop.samp$tb <- ifelse(with(startstop.samp, !is.na(Ttb) & fuptime >= Ttb), 1, 0)
##D      startstop.samp$tb.lag <- ifelse(with(startstop.samp, !is.na(Ttb) & fuptime > Ttb), 1, 0)
##D      startstop.samp$event <- ifelse(with(startstop.samp, !is.na(Tdeath) & fuptime >= Tdeath), 1, 0)
##D      startstop.samp$cd4.sqrt <- predict(cd4.lme, newdata = data.frame(id.samp =
##D        startstop.samp$id.samp, fuptime = startstop.samp$fuptime, tb.lag = startstop.samp$tb.lag))
##D 
##D      return(coef(coxph(Surv(tstart, fuptime, event) ~ tb, data = startstop.samp,
##D         weights = ipwtm(
##D              exposure = tb,
##D              family = "survival",
##D              numerator = ~ 1,
##D              denominator = ~ cd4.sqrt,
##D              id = id.samp,
##D              tstart = tstart,
##D              timevar = fuptime,
##D              type = "first",
##D              data = startstop.samp)$ipw.weights))[1])
##D      }
##D   bootres <- boot(data = basdat, statistic = boot.fun, R = 999, data.tm = timedat)
##D   bootres
##D   boot.ci(bootres, type = "basic")
## End(Not run)



