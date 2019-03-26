library(ecoreg)


### Name: eco
### Title: Ecological regression using aggregate and/or individual data
### Aliases: eco
### Keywords: models regression nonlinear

### ** Examples


## Simulate some aggregate data and some combined aggregate and
## individual data. 
ng <- 50
N <- rep(100, ng)
set.seed(1)
ctx <- cbind(deprivation = rnorm(ng), mean.income = rnorm(ng))
phi <- cbind(nonwhite = runif(ng), smoke = runif(ng))
sim.df <- as.data.frame(cbind(ctx, phi))
mu <- qlogis(0.05)  ## Disease with approximate 5% prevalence

## Odds ratios for group-level deprivation and mean imcome
alpha.c <- log(c(1.01, 1.02))
## Odds ratios for individual-level ethnicity and smoking
alpha <- log(c(1.5, 2)) 

sim1 <- sim.eco(N, ctx=~deprivation+mean.income, binary=~nonwhite+smoke,
                data = sim.df,  mu=mu, alpha.c=alpha.c, alpha=alpha)
sim2 <- sim.eco(N, ctx=~deprivation+mean.income, binary=~nonwhite+smoke,
                data = sim.df,  mu=mu, alpha.c=alpha.c, alpha=alpha, isam=7)

## Fit the model to recover the simulated odds ratios.

aggdata <- as.data.frame(cbind(y=sim1$y, sim.df))
agg.eco <- eco(cbind(y, N) ~ deprivation + mean.income,
               binary = ~ nonwhite + smoke,  data = aggdata)
agg.eco

## Combining with individual-level data
## doesn't improve the precision of the estimates.

agg.indiv.eco <- eco(cbind(y, N) ~ deprivation + mean.income,
               binary = ~ nonwhite + smoke,
               iformula = y ~ deprivation + mean.income + nonwhite + smoke, 
               data = aggdata, idata=sim2$idata)
agg.indiv.eco

## However, suppose we have much lower between-area variance in the
## mean covariate value.

phi <- cbind(nonwhite = runif(ng, 0, 0.3), smoke = runif(ng, 0.1, 0.4))
sim.df <- as.data.frame(cbind(ctx, phi))
sim1 <- sim.eco(N, ctx=~deprivation+mean.income, binary=~nonwhite+smoke,
                data = sim.df,  mu=mu, alpha.c=alpha.c, alpha=alpha)
sim2 <- sim.eco(N, ctx=~deprivation+mean.income, binary=~nonwhite+smoke,
                data = sim.df,  mu=mu, alpha.c=alpha.c, alpha=alpha, isam=10)
aggdata <- as.data.frame(cbind(y=sim1$y, sim.df))

## The aggregate data now contain little information about the
## individual-level effects, and we get biased estimates of the true
## individual model. 
agg.eco <- eco(cbind(y, N) ~ deprivation + mean.income,
               binary = ~ nonwhite + smoke,  data = aggdata)
agg.eco

## We need individual-level data to be able to estimate the
## individual-level effects accurately. 
agg.indiv.eco <- eco(cbind(y, N) ~ deprivation + mean.income,
               binary = ~ nonwhite + smoke,
               iformula = y ~ deprivation + mean.income + nonwhite + smoke, 
               data = aggdata, idata=sim2$idata)
agg.indiv.eco

## But then why not just study the individual data?  Combining with
## aggregate data improves precision.  
indiv.eco <- eco(iformula = y ~ deprivation + mean.income + nonwhite + smoke, 
               idata=sim2$idata)
indiv.eco




