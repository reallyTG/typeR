library(time2event)


### Name: tcoxph
### Title: Fit Proportional Hazards Regression Model with time-to-event
###   data as covariates.
### Aliases: tcoxph

### ** Examples

  data(pegvhd)

  # convert to data with time-to-event data as covariates
  # os with cgvhd
  tos1data = time2data(c("os.t","os.s"),c("gvhd.t","gvhd.s","pe.t","pe.s"),pegvhd)$data

  # no time-varying analysis with 'coxph' and 'comp.risk'
  os1r = coxph(Surv(os.t,os.s)~gvhd.s+pe.s+age+sex,data=pegvhd)

  # time-varying analysis with 'coxph' and 'comp.risk'
  nt.os1r = coxph(Surv(start,end,os.s)~gvhd.s+pe.s+age+sex,data=tos1data)

  # time-varying analysis with 'tcoxph' and 'tcomp.risk'
  t.os1r = tcoxph(Surv(os.t,os.s)~time(gvhd.t,gvhd.s)+time(pe.t,pe.s)+age+sex
  			,data=pegvhd)

  data(bmtelder)

  # convert to data with time-to-event data as covariates
  # os with cgvhd
  tos2data = time2data(c("os.t","os.s"),c("cgvhd.t","cgvhd.s"),bmtelder)$data

  # no time-varying analysis with 'coxph'
  os2r = coxph(Surv(os.t,os.s)~cgvhd.s+cond+donor,data=bmtelder)

  # time-varying analysis with 'coxph'
  nt.os2r = coxph(Surv(start,end,os.s)~cgvhd.s+cond+donor,data=tos2data)

  # time-varying analysis with 'tcoxph'
  t.os2r = tcoxph(Surv(os.t,os.s)~time(cgvhd.t,cgvhd.s)+cond+donor,data=bmtelder)




