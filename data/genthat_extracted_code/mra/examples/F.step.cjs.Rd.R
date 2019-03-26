library(mra)


### Name: F.step.cjs
### Title: F.step.cjs - Stepwise model selection for CJS models.
### Aliases: F.step.cjs
### Keywords: survival models

### ** Examples


#   Aquire data and intermediate variables
data(dipper.histories)
data(dipper.males)
ch <- dipper.histories
males <- dipper.males
ns <- ncol(ch)
nan <- nrow(ch)

#   Construct covariates
small.t <- as.factor( paste("T",1:ns, sep=""))
post.flood <- as.numeric( 1:ns >= 4 )
year <- 1:ns - (ns / 2)
males.postflood <- outer( c(males), post.flood ) # individual and time varying

print(dim(males.postflood))

#   Attach attributes to covariates.  For convienence only.
attr(small.t, "nan") <- nan
attr(small.t, "drop") <- c(1,2)
attr(year, "nan") <- nan
attr(post.flood, "nan") <- nan
attr(males, "ns") <- ns

#   Define pool of variables to be considered in each model
cap.vars <- c("tvar(small.t)","tvar(year)")
surv.vars <- c("tvar(small.t)","tvar(year)", "tvar(post.flood)", "ivar(males)",
  "males.postflood")

#   Do stepwise selection
final.fit <- F.step.cjs( cap.vars, surv.vars, histories=ch, 
  control=mra.control(maxfn=500, cov.meth=2) )





