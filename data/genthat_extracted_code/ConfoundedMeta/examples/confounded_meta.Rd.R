library(ConfoundedMeta)


### Name: confounded_meta
### Title: Estimates and inference for sensitivity analyses
### Aliases: confounded_meta

### ** Examples

d = metafor::escalc(measure="RR", ai=tpos, bi=tneg,
ci=cpos, di=cneg, data=metafor::dat.bcg)

m = metafor::rma.uni(yi= d$yi, vi=d$vi, knha=FALSE,
                     measure="RR", method="DL" ) 
yr = as.numeric(m$b)  # metafor returns on log scale
vyr = as.numeric(m$vb)
t2 = m$tau2
vt2 = m$se.tau2^2 

# obtaining all three estimators and inference
confounded_meta( .q=log(0.90), .r=0.20, .muB=log(1.5), .sigB=0.1,
                 .yr=yr, .vyr=vyr, .t2=t2, .vt2=vt2,
                 CI.level=0.95 )

# passing only arguments needed for prop point estimate
confounded_meta( .q=log(0.90), .muB=log(1.5),
                 .yr=yr, .t2=t2, CI.level=0.95 )

# passing only arguments needed for Tmin, Gmin point estimates
confounded_meta( .q=log(0.90), .r=0.20,
                 .yr=yr, .t2=t2, CI.level=0.95 )



