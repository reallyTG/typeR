library(epiR)


### Name: epi.directadj
### Title: Directly adjusted incidence rate estimates
### Aliases: epi.directadj
### Keywords: univar univar

### ** Examples

## EXAMPLE 1 (from Thrusfield 2007 pp. 63 - 64):
## A study was conducted to estimate the seroprevalence of leptospirosis
## in dogs in Glasgow and Edinburgh, Scotland. For the matrix titled pop
## the numbers represent dog-years at risk. The following data were 
## obtained for male and female dogs:

dat <- data.frame(obs = c(15,46,53,16), tar = c(48,212,180,71), 
   sex = c("M","F","M","F"), city = c("ED","ED","GL","GL"))

obs <- matrix(dat$obs, nrow = 2, byrow = TRUE, 
   dimnames = list(c("ED","GL"), c("M","F")))
tar <- matrix(dat$tar, nrow = 2, byrow = TRUE, 
   dimnames = list(c("ED","GL"), c("M","F")))
std <- matrix(data = c(250,250), nrow = 1, byrow = TRUE, 
   dimnames = list("", c("M","F")))

## Compute directly adjusted seroprevalence estimates, using a standard 
## population with equal numbers of male and female dogs:

std <- matrix(data = c(250,250), nrow = 1, byrow = TRUE, 
   dimnames = list("", c("M","F")))

epi.directadj(obs, tar, std, units = 1, conf.level = 0.95)

## > $crude
## >   strata cov       est     lower     upper
## > 1     ED   M 0.3125000 0.1749039 0.5154212
## > 2     GL   M 0.2944444 0.2205591 0.3851406
## > 3     ED   F 0.2169811 0.1588575 0.2894224
## > 4     GL   F 0.2253521 0.1288082 0.3659577

## > $crude.strata
## >  strata       est     lower     upper
## > 1     ED 0.2346154 0.1794622 0.3013733
## > 2     GL 0.2749004 0.2138889 0.3479040

## > $adj.strata
## >   strata       est     lower     upper
## > 1     ED 0.2647406 0.1866047 0.3692766
## > 2     GL 0.2598983 0.1964162 0.3406224

## The confounding effect of gender has been removed by the adjusted 
## incidence rate estimates.

## The adjusted incidence rate of leptospirosis in Glasgow dogs is 26 (95%
## CI 20 to 34) cases per 100 dog-years at risk.

## EXAMPLE 2 --- A more flexible approach for calculating adjusted incidence
## rate estimates using Poisson regression. See Frome and Checkoway (1985) for
## details.
dat.glm01 <- glm(obs ~ city, offset = log(tar), family = poisson, data = dat)
summary(dat.glm01)

## If you want to obtain adjusted incidence rate estimates, use the predict 
## method on a new data set with the time at risk (tar) variable set to 1 
## (which means log(tar) = 0). This will return the predicted number of 
## cases per one unit of individual time, i.e. the incidence rate.

dat.pred01 <- predict(object = dat.glm01, newdata = 
   data.frame(city = c("ED","GL"), tar = c(1,1)), 
   type  = "link", se = TRUE)

conf.level <- 0.95
critval <- qnorm(p = 1 - ((1 - conf.level) / 2), mean = 0, sd = 1)
est <- dat.glm01$family$linkinv(dat.pred01$fit)
lower <- dat.glm01$family$linkinv(dat.pred01$fit - 
   (critval * dat.pred01$se.fit))
upper <- dat.glm01$family$linkinv(dat.pred01$fit + 
   (critval * dat.pred01$se.fit))
round(data.frame(est, lower, upper), 3)

##   est lower upper
## 0.235 0.183 0.302
## 0.275 0.217 0.348
## Results identical to the crude incidence rate estimates from 
## epi.directadj.

## We now adjust for the effect of gender and city and report the adjusted 
## incidence rate estimates for each city:
dat.glm02 <- dat.glm02 <- glm(obs ~ city + sex, offset = log(tar), 
   family = poisson, data = dat)
dat.pred02 <- predict(object = dat.glm02, newdata = 
   data.frame(sex = c("F","F"), city = c("ED","GL"), tar = c(1,1)), 
   type  = "link", se.fit = TRUE)

conf.level <- 0.95
critval <- qnorm(p = 1 - ((1 - conf.level) / 2), mean = 0, sd = 1)
est <- dat.glm02$family$linkinv(dat.pred02$fit)
lower <- dat.glm02$family$linkinv(dat.pred02$fit - 
   (critval * dat.pred02$se.fit))
upper <- dat.glm02$family$linkinv(dat.pred02$fit + 
   (critval * dat.pred02$se.fit))
round(data.frame(est, lower, upper), 3)

##   est lower upper
## 0.220 0.168 0.287
## 0.217 0.146 0.323

## Using Poisson regression the gender adjusted incidence rate of leptospirosis 
## in Glasgow dogs was 22 (95% CI 15 to 32) cases per 100 dog-years at risk.
## These results won't be the same as those using direct adjustment because
## for direct adjustment we use a contrived standard population.

## EXAMPLE 3 --- Logistic regression to return adjusted incidence risk 
## estimates:

## Say, for argument's sake, that we are now working with incidence risk data. 
## Here we'll re-label the variable 'tar' (time at risk) as 'pop' 
## (population size). We adjust for the effect of gender and city and 
## report the adjusted incidence risk of canine leptospirosis estimates for 
## each city:

dat$pop <- dat$tar

dat.glm03 <- glm(cbind(obs, pop - obs) ~ city + sex, 
   family = "binomial", data = dat)
dat.pred03 <- predict(object = dat.glm03, newdata = 
   data.frame(sex = c("F","F"), city = c("ED","GL")), 
   type  = "link", se.fit = TRUE)

conf.level <- 0.95
critval <- qnorm(p = 1 - ((1 - conf.level) / 2), mean = 0, sd = 1)
est <- dat.glm03$family$linkinv(dat.pred03$fit)
lower <- dat.glm03$family$linkinv(dat.pred03$fit - 
   (critval * dat.pred03$se.fit))
upper <- dat.glm03$family$linkinv(dat.pred03$fit + 
   (critval * dat.pred03$se.fit))
round(data.frame(est, lower, upper), 3)

##   est lower upper
## 0.220 0.172 0.276
## 0.217 0.150 0.304

## The adjusted incidence risk of leptospirosis in Glasgow dogs is 22 (95%
## CI 15 to 30) cases per 100 dogs at risk.




