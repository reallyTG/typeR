## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(season)
library(MASS) # for mvrnorm
library(survival) # for coxph
library(ggplot2)
library(dlnm) # for splines

## ------------------------------------------------------------------------
data(CVDdaily)
ggplot(CVDdaily, aes(x=factor(month), y=cvd))+
 geom_boxplot()+
 ylab('Daily number of CVD deaths')+
 xlab('Month')+
 theme_bw()

## ---- fig.width=7--------------------------------------------------------
years = 1987:2001
Januarys = as.numeric(as.Date(paste(years, '-01-01', sep=''), origin='1970-01-01'))
ggplot(CVDdaily, aes(x=as.numeric(date), y=cvd))+
 geom_line()+
 scale_x_continuous(breaks=Januarys, labels=years)+
 ylab('Daily number of CVD deaths')+
 xlab('Time')+
 theme_bw()+
 theme(panel.grid.minor = element_blank())

## ---- fig.width=6--------------------------------------------------------
ggplot(CVDdaily, aes(x=tmpd, y=cvd))+
 geom_point()+
 ylab('Daily number of CVD deaths')+
 xlab('Temperature (degrees F)')+
 theme_bw()

## ---- warning=FALSE, message=FALSE---------------------------------------
# make a spline basis that has a lag and is non-linear
tmpd.basis = crossbasis(CVDdaily$tmpd, lag=14, # 14 day lag
                arglag=list(fun='ns', df=3), # 3 degrees of freedom for lag; ns = natural spline
                argvar=list(fun='ns', knots=c(60, 75))) # knots at 65 and 75 degrees
# add the spline basis variables to the data
CVDdaily = cbind(CVDdaily, tmpd.basis[1:nrow(CVDdaily), ])
# create the regression formula
spline.names = colnames(tmpd.basis)
formula = paste('cvd ~', paste(spline.names, collapse = ' + '), '+ Mon + Tue + Wed + Thu + Fri + Sat')
model = casecross(as.formula(formula), data=CVDdaily)
summary(model)

## ------------------------------------------------------------------------
confint(model$c.model)

## ---- fig.height=5, fig.width=5------------------------------------------
# extract the coefficients and variance--covariance matrix for the spline terms
coef = coefficients(model$c.model)
index = names(coef) %in% spline.names
coef = coef[index]
vcov = vcov(model$c.model)[index, index]
for.plot = crosspred(basis=tmpd.basis, coef=coef, vcov=vcov, at=seq(45, 85, 1), model.link = 'log', cen=70)
par(mai=c(0.2, 0, 0, 0)) # reduce plot margins
plot(for.plot, xlab='Temperature (degrees F)', zlab='Odds ratio', ylab='Lag (days)')

## ---- fig.width=5--------------------------------------------------------
to.plot = data.frame(temperature = for.plot$predvar, 
                     mean = for.plot$allRRfit,
                     lower = for.plot$allRRlow,
                     upper = for.plot$allRRhigh)
ggplot(data=to.plot, aes(x=temperature, y=mean, ymin=lower, ymax=upper))+
  geom_hline(lty=2, yintercept = 1)+ # horizontal reference line at no change in odds
  geom_ribbon(alpha=0.3)+
  geom_line()+
  xlab('Temperature (degrees F)')+
  ylab('Odds ratio')+
  theme_bw()

## ---- fig.width=7, warning=FALSE-----------------------------------------
set.seed(1234) # set the random seed to give repeatable results
data(CVD)
f = c(12) # a single twelve month cycle
tau = c(10, 50) # achieved via trial-and-error; small tau -> less variability
ns.season = nscosinor(data=CVD, response='adj', cycles=f, niters=2000,
         burnin=500, tau=tau, div=1000)
summary(ns.season)
plot(ns.season)

## ------------------------------------------------------------------------
cat('Mean phase = ', round(invyrfraction(0.6952055/(2*pi), type='monthly', text=F), 2), ' months.\n', sep='')
cat('Lower 95% interval = ', round(invyrfraction(0.5732958/(2*pi), type='monthly', text=F), 2), ' months.\n', sep='')
cat('Upper 95% interval = ', round(invyrfraction(0.8216251/(2*pi), type='monthly', text=F), 2), ' months.\n', sep='')

## ------------------------------------------------------------------------
set.seed(1234) # set the random seed to give repeatable results
ntest.residuals = nonlintest(ns.season$residuals, n.lag=12, n.boot=500)
ntest.residuals

## ---- warnings=FALSE, fig.width=5, fig.height=5--------------------------
plot = plot(ntest.residuals, plot=FALSE)
plot + scale_x_continuous(breaks = 0:12) +
  scale_y_continuous(breaks = 0:12) +
  theme_bw()+
  xlab('Lag 1 (months)')+
  ylab('Lag 2 (months)')+
  theme(panel.grid.minor = element_blank())

