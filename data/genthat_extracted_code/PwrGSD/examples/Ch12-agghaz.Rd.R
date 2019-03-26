library(PwrGSD)


### Name: agghaz
### Title: Aggregated Hazard
### Aliases: agghaz
### Keywords: survival manip

### ** Examples

  library(PwrGSD)
  data(lung)
  fit.msf <- mysurvfit(Surv(time, I(status==2)) ~ sex, data=lung)

  ## A single stratum:
  with(fit.msf$Table, agghaz(30, time, cbind(nrisk.sex1), cbind(nevent.sex1)))

  ## Multiple strata--pooled and group 1:
  with(fit.msf$Table, agghaz(30, time, cbind(nrisk.sex1+nrisk.sex2,nrisk.sex1),
                                       cbind(nevent.sex1+nevent.sex2,nevent.sex1)))



