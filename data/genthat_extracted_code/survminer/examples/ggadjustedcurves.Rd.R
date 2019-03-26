library(survminer)


### Name: ggadjustedcurves
### Title: Adjusted Survival Curves for Cox Proportional Hazards Model
### Aliases: ggadjustedcurves

### ** Examples


library(survival)
fit2 <- coxph( Surv(stop, event) ~ size, data = bladder )
# single curve
ggadjustedcurves(fit2, data = bladder)

fit2 <- coxph( Surv(stop, event) ~ size + strata(rx), data = bladder )
# average in groups
ggadjustedcurves(fit2, data = bladder, method = "average", variable = "rx")

# conditional balancing in groups
ggadjustedcurves(fit2, data = bladder, method = "conditional", variable = "rx")
# selected reference population
ggadjustedcurves(fit2, data = bladder, method = "conditional", variable = "rx",
    reference = bladder[bladder$rx == "1",])

# marginal balancing in groups
ggadjustedcurves(fit2, data = bladder, method = "marginal", variable = "rx")

## Not run: 
##D # this will take some time
##D fdata <- flchain[flchain$futime >=7,]
##D fdata$age2 <- cut(fdata$age, c(0,54, 59,64, 69,74,79, 89, 110),
##D                   labels = c(paste(c(50,55,60,65,70,75,80),
##D                                    c(54,59,64,69,74,79,89), sep='-'), "90+"))
##D fdata$group <- factor(1+ 1*(fdata$flc.grp >7) + 1*(fdata$flc.grp >9),
##D                       levels=1:3,
##D                       labels=c("FLC < 3.38", "3.38 - 4.71", "FLC > 4.71"))
##D # single curve
##D fit <- coxph( Surv(futime, death) ~ age*sex, data = fdata)
##D ggadjustedcurves(fit, data = fdata, method = "single")
##D 
##D # average in groups
##D fit <- coxph( Surv(futime, death) ~ age*sex + strata(group), data = fdata)
##D ggadjustedcurves(fit, data = fdata, method = "average")
##D 
##D # conditional balancing in groups
##D ggadjustedcurves(fit, data = fdata, method = "conditional", reference = fdata)
##D 
##D # marginal balancing in groups
##D ggadjustedcurves(fit, data = fdata, method = "marginal")
## End(Not run)




