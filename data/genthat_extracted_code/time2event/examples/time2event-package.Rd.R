library(time2event)


### Name: time2event-package
### Title: Survival and competing risk analyses with time-to-event data as
###   covariates.
### Aliases: time2event-package time2event
### Keywords: survival

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

  # nrm with cgvhd
  tnrm2data = time2data(c("nrm.t","nrm.s"),c("cgvhd.t","cgvhd.s"),bmtelder)$data

  # no time-varying analysis with 'coxph' and 'comp.risk'
  os2r = coxph(Surv(os.t,os.s)~cgvhd.s+cond+donor,data=bmtelder)
  set.seed(3927)
  cr2r = comp.risk(Event(nrm.t,nrm.s)~cgvhd.s+cond+donor,data=bmtelder,
  			cause=1,resample.iid=1,n.sim=1000,model="additive")
  cr2r.pred = predict(cr2r,X=1)
  plot(cr2r.pred)

  # time-varying analysis with 'coxph' and 'comp.risk'
  nt.os2r = coxph(Surv(start,end,os.s)~cgvhd.s+cond+donor,data=tos2data)
  set.seed(3927)
  nt.cr2r = comp.risk(Event(start,end,nrm.s)~cgvhd.s+cond+donor,data=tnrm2data,
  			cause=1,resample.iid=1,n.sim=1000,model="additive")
  nt.cr2r.pred = predict(nt.cr2r,X=1)
  plot(nt.cr2r.pred)

  # time-varying analysis with 'tcoxph' and 'tcomp.risk'
  t.os2r = tcoxph(Surv(os.t,os.s)~time(cgvhd.t,cgvhd.s)+cond+donor,data=bmtelder)
  set.seed(3927)
  t.cr2r = tcomp.risk(Event(nrm.t,nrm.s)~time(cgvhd.t,cgvhd.s)+cond+donor,data=bmtelder,
  			cause=1,resample.iid=1,n.sim=1000,model="additive")
  t.cr2r.pred = predict(t.cr2r,X=1)
  plot(t.cr2r.pred)



