library(joineR)


### Name: joint
### Title: Fit joint model for survival and longitudinal data measured with
###   error
### Aliases: joint
### Keywords: models survival

### ** Examples

## Standard joint model

data(heart.valve)
heart.surv <- UniqueVariables(heart.valve,
                              var.col = c("fuyrs", "status"),
                              id.col = "num")
heart.long <- heart.valve[, c("num", "time", "log.lvmi")]
heart.cov <- UniqueVariables(heart.valve,
                             c("age", "hs", "sex"),
                             id.col = "num")
heart.valve.jd <- jointdata(longitudinal = heart.long,
                            baseline = heart.cov,
                            survival = heart.surv,
                            id.col = "num",
                            time.col = "time")
fit <- joint(data = heart.valve.jd,
             long.formula = log.lvmi ~ 1 + time + hs,
             surv.formula = Surv(fuyrs, status) ~ hs,
             model = "intslope")
             
## Competing risks joint model (same data as Williamson et al. 2008)

## Not run: 
##D data(epileptic)
##D epileptic$interaction <- with(epileptic, time * (treat == "LTG"))
##D longitudinal <- epileptic[, c(1:3, 13)]
##D survival <- UniqueVariables(epileptic, c(4, 6), "id")
##D baseline <- UniqueVariables(epileptic, "treat", "id")
##D data <- jointdata(longitudinal = longitudinal,
##D                   survival = survival,
##D                   baseline = baseline,
##D                   id.col = "id",
##D                   time.col = "time")
##D                   
##D fit2 <- joint(data = data,
##D               long.formula = dose ~ time + treat + interaction,
##D               surv.formula = Surv(with.time, with.status2) ~ treat,
##D               longsep = FALSE, survsep = FALSE,
##D               gpt = 3)
##D summary(fit2)
## End(Not run)



