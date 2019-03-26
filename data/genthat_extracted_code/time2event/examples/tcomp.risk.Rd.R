library(time2event)


### Name: tcomp.risk
### Title: Competings Risks Regression with time-to-event data as
###   covariates.
### Aliases: tcomp.risk

### ** Examples

  data(bmtelder)

  # convert to data with time-to-event data as covariates
  # nrm with cgvhd
  tnrm2data = time2data(c("nrm.t","nrm.s"),c("cgvhd.t","cgvhd.s"),bmtelder)$data

  # no time-varying analysis with 'comp.risk'
  set.seed(3927)
  cr2r = comp.risk(Event(nrm.t,nrm.s)~cgvhd.s+cond+donor,data=bmtelder,
  			cause=1,resample.iid=1,n.sim=1000,model="additive")
  cr2r.pred = predict(cr2r,X=1)
  plot(cr2r.pred)

  # time-varying analysis with 'comp.risk'
  set.seed(3927)
  nt.cr2r = comp.risk(Event(start,end,nrm.s)~cgvhd.s+cond+donor,data=tnrm2data,
  			cause=1,resample.iid=1,n.sim=1000,model="additive")
  nt.cr2r.pred = predict(nt.cr2r,X=1)
  plot(nt.cr2r.pred)

  # time-varying analysis with 'tcomp.risk'
  set.seed(3927)
  t.cr2r = tcomp.risk(Event(nrm.t,nrm.s)~time(cgvhd.t,cgvhd.s)+cond+donor,data=bmtelder,
  			cause=1,resample.iid=1,n.sim=1000,model="additive")
  t.cr2r.pred = predict(t.cr2r,X=1)
  plot(t.cr2r.pred)



