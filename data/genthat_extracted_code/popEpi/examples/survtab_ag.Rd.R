library(popEpi)


### Name: survtab_ag
### Title: Estimate Survival Time Functions
### Aliases: survtab_ag

### ** Examples

## see more examples with explanations in vignette("survtab_examples")

#### survtab_ag usage

data("sire", package = "popEpi")
## prepare data for e.g. 5-year "period analysis" for 2008-2012
## note: sire is a simulated cohort integrated into popEpi.
BL <- list(fot=seq(0, 5, by = 1/12),
           per = c("2008-01-01", "2013-01-01"))
x <- lexpand(sire, birth = bi_date, entry = dg_date, exit = ex_date,
             status = status %in% 1:2,
             breaks = BL,
             pophaz = popmort,
             aggre = list(fot))
             
## calculate relative EdererII period method
## NOTE: x is an aggre object here, so surv.breaks are deduced
## automatically
st <- survtab_ag(fot ~ 1, data = x)

summary(st, t = 1:5) ## annual estimates
summary(st, q = list(r.e2 = 0.75)) ## 1st interval where r.e2 < 0.75 at end
## Not run: 
##D plot(st)
##D 
##D 
##D ## non-aggre data: first call to survtab_ag would fail
##D df <- data.frame(x)
##D # st <- survtab_ag(fot ~ 1, data = x)
##D st <- survtab_ag(fot ~ 1, data = x, surv.breaks = BL$fot)
##D 
##D ## calculate age-standardised 5-year relative survival ratio using 
##D ## Ederer II method and period approach 
##D 
##D sire$agegr <- cut(sire$dg_age,c(0,45,55,65,75,Inf),right=F)
##D BL <- list(fot=seq(0, 5, by = 1/12),
##D            per = c("2008-01-01", "2013-01-01"))
##D x <- lexpand(sire, birth = bi_date, entry = dg_date, exit = ex_date,
##D              status = status %in% 1:2,
##D              breaks = BL,
##D              pophaz = popmort,
##D              aggre = list(agegr, fot))
##D 
##D ## age standardisation using internal weights (age distribution of 
##D ## patients diagnosed within the period window)
##D ## (NOTE: what is done here is equivalent to using weights = "internal")
##D w <- aggregate(at.risk ~ agegr, data = x[x$fot == 0], FUN = sum)
##D names(w) <- c("agegr", "weights")
##D 
##D st <- survtab_ag(fot ~ adjust(agegr), data = x, weights = w)
##D plot(st, y = "r.e2.as", col = c("blue"))
##D 
##D ## age standardisation using ICSS1 weights
##D data(ICSS)
##D cut <- c(0, 45, 55, 65, 75, Inf)
##D agegr <- cut(ICSS$age, cut, right = FALSE)
##D w <- aggregate(ICSS1~agegr, data = ICSS, FUN = sum)
##D names(w) <- c("agegr", "weights")
##D 
##D st <- survtab_ag(fot ~ adjust(agegr), data = x, weights = w)
##D lines(st, y = "r.e2.as", col = c("red"))
##D 
##D 
##D ## cause-specific survival
##D sire$stat <- factor(sire$status, 0:2, c("alive", "canD", "othD"))
##D x <- lexpand(sire, birth = bi_date, entry = dg_date, exit = ex_date,
##D              status = stat,
##D              breaks = BL,
##D              pophaz = popmort,
##D              aggre = list(agegr, fot))
##D st <- survtab_ag(fot ~ adjust(agegr), data = x, weights = w,
##D                  d = c("fromalivetocanD", "fromalivetoothD"),
##D                  surv.type = "surv.cause")
##D plot(st, y = "surv.obs.fromalivetocanD.as")
##D lines(st, y = "surv.obs.fromalivetoothD.as", col = "red")
##D 
##D 
## End(Not run)



