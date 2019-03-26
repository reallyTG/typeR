library(surveillance)


### Name: twinstim
### Title: Fit a Two-Component Spatio-Temporal Point Process Model
### Aliases: twinstim
### Keywords: models optimize

### ** Examples

# Load invasive meningococcal disease data
data("imdepi")


### first, fit a simple endemic-only model

m_noepi <- twinstim(
    endemic = addSeason2formula(~ offset(log(popdensity)) + I(start/365-3.5),
                                S=1, period=365, timevar="start"),
    data = imdepi, subset = !is.na(agegrp)
)

## look at the model summary
summary(m_noepi)

## there is no evidence for a type-dependent endemic intercept (LR test)
m_noepi_type <- update(m_noepi, endemic = ~(1|type) + .)
pchisq(2*c(logLik(m_noepi_type)-logLik(m_noepi)), df=1, lower.tail=FALSE)


### add an epidemic component with just the intercept, i.e.
### assuming uniform dispersal in time and space up to a distance of
### eps.s = 200 km and eps.t = 30 days (see summary(imdepi))

m0 <- update(m_noepi, epidemic=~1, model=TRUE)

## summarize the model fit
s <- summary(m0, correlation = TRUE, symbolic.cor = TRUE)
s
# output the table of coefficients as LaTeX code
toLatex(s, digits=2)
# or, to report rate ratios
xtable(s)

## the default confint-method can be used for Wald-CI's
confint(m0, level=0.95)

## same "untrimmed" R0 for every event (simple epidemic intercept model)
summary(R0(m0, trimmed=FALSE))

## plot the path of the fitted total intensity
plot(m0, "total intensity", tgrid=500)

## extract "residual process" integrating over space (takes some seconds)
if (surveillance.options("allExamples"))
{
  res <- residuals(m0)
  # if the model describes the true CIF well _in the temporal dimension_,
  # then this residual process should behave like a stationary Poisson
  # process with intensity 1
  plot(res, type="l"); abline(h=c(0, length(res)), lty=2)
  # easier, with CI and serial correlation -> checkResidualProcess()
  checkResidualProcess(m0)
}

## Not run: 
##D   ## NB: in contrast to using nlminb() optim's BFGS would miss the
##D   ##     likelihood maximum wrt the epidemic intercept
##D   m0_BFGS <- update(m_noepi, epidemic=~1, optim.args = list(method="BFGS"))
##D   format(cbind(nlminb=coef(m0), BFGS=coef(m0_BFGS)), digits=3, scientific=FALSE)
##D   m0_BFGS$fisherinfo   # singular Fisher information matrix here
##D   m0$fisherinfo
##D   logLik(m0_BFGS)
##D   logLik(m0)
##D   ## nlminb is more powerful since we make use of the analytical fisherinfo
##D   ## as estimated by the model during optimization, which optim cannot
## End(Not run)


### an epidemic-only model?
## for a purely epidemic model, all events must have potential source events
## (otherwise the intensity at the observed event would be 0)

## let's focus on the C-type for this example
imdepiC <- subset(imdepi, type == "C")
table(summary(imdepiC)$nSources)
## 106 events have no prior, close events (in terms of eps.s and eps.t)
try(twinstim(epidemic = ~1, data = imdepiC))  # detects this problem
## let's assume spatially unbounded interaction
imdepiC_infeps <- update(imdepiC, eps.s = Inf)
(s <- summary(imdepiC_infeps))
table(s$nSources)
## for 11 events, there is no prior event within eps.t = 30 days
## (which is certainly true for the first event)
plot(s$counter, main = "Number of infectious individuals over time (eps.t = 30)")
rug(imdepiC_infeps$events$time)
rug(imdepiC_infeps$events$time[s$nSources == 0], col = 2, lwd = 3)
## An endemic component would catch such events (from unobserved sources),
## otherwise a longer infectious period would need to be assumed and
## for the first event to happen, a prehistory is required (e.g., t0 = 31).
## As an example, we fit the data only until T = 638 (all events have ancestors)
m_epi <- twinstim(epidemic = ~1, data = imdepiC_infeps, t0 = 31, T = 638)
summary(m_epi)


### full model with interaction functions (time-consuming)
if (surveillance.options("allExamples"))
{
  ## estimate an exponential temporal decay of infectivity
  m1_tiaf <- update(m0, tiaf=tiaf.exponential())
  plot(m1_tiaf, "tiaf", scaled=FALSE)

  ## estimate a step function for spatial interaction
  summary(sourceDists <- getSourceDists(imdepi, "space"))
  (knots <- quantile(sourceDists, c(5,10,20,40)/100))
  m1_fstep <- update(m0, siaf=knots)
  plot(m1_fstep, "siaf", scaled=FALSE)
  rug(sourceDists, ticksize=0.02)

  ## estimate a continuously decreasing spatial interaction function,
  ## here we use the kernel of an isotropic bivariate Gaussian
  m1 <- update(m0, siaf = siaf.gaussian())
  AIC(m_noepi, m0, m1_fstep, m1)
  summary(m1)  # e.siaf.1 is log(sigma), no test for H0: log(sigma) = 0
  exp(confint(m1, "e.siaf.1"))  # a confidence interval for sigma
  plot(m1, "siaf", scaled=FALSE)
  ## alternative: siaf.powerlaw() with eps.s=Inf and untie()d data,
  ##              see vignette("twinstim")

  ## add epidemic covariates
  m2 <- update(m1, epidemic = ~ 1 + type + agegrp)
  AIC(m1, m2)   # further improvement
  summary(m2)
  
  ## look at estimated R0 values by event type
  tapply(R0(m2), imdepi$events@data[names(R0(m2)), "type"], summary)
}



