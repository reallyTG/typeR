library(popEpi)


### Name: survtab
### Title: Estimate Survival Time Functions
### Aliases: survtab

### ** Examples

## Not run: 
##D data("sire", package = "popEpi")
##D library(Epi)
##D library(survival)
##D 
##D ## NOTE: recommended to use factor status variable
##D x <- Lexis(entry = list(FUT = 0, AGE = dg_age, CAL = get.yrs(dg_date)), 
##D            exit = list(CAL = get.yrs(ex_date)), 
##D            data = sire[sire$dg_date < sire$ex_date, ],
##D            exit.status = factor(status, levels = 0:2, 
##D                                 labels = c("alive", "canD", "othD")), 
##D            merge = TRUE)
##D 
##D ## phony group variable
##D set.seed(1L)
##D x$group <- rbinom(nrow(x), 1, 0.5)
##D 
##D ## observed survival. explicit supplying of status:
##D st <- survtab(Surv(time = FUT, event = lex.Xst) ~ group, data = x, 
##D               surv.type = "surv.obs",
##D               breaks = list(FUT = seq(0, 5, 1/12)))
##D ## this assumes the status is lex.Xst (right 99.9 % of the time)
##D st <- survtab(FUT ~ group, data = x, 
##D               surv.type = "surv.obs",
##D               breaks = list(FUT = seq(0, 5, 1/12)))
##D               
##D ## relative survival (ederer II)
##D data("popmort", package = "popEpi")
##D pm <- data.frame(popmort)
##D names(pm) <- c("sex", "CAL", "AGE", "haz")
##D st <- survtab(FUT ~ group, data = x, 
##D               surv.type = "surv.rel",
##D               pophaz = pm,
##D               breaks = list(FUT = seq(0, 5, 1/12)))
##D 
##D ## ICSS weights usage
##D data("ICSS", package = "popEpi")
##D cut <- c(0, 30, 50, 70, Inf)
##D agegr <- cut(ICSS$age, cut, right = FALSE)
##D w <- aggregate(ICSS1~agegr, data = ICSS, FUN = sum)
##D x$agegr <- cut(x$dg_age, cut, right = FALSE)
##D st <- survtab(FUT ~ group + adjust(agegr), data = x, 
##D               surv.type = "surv.rel",
##D               pophaz = pm, weights = w$ICSS1,
##D               breaks = list(FUT = seq(0, 5, 1/12)))
##D 
##D #### using dates with survtab
##D x <- Lexis(entry = list(FUT = 0L, AGE = dg_date-bi_date, CAL = dg_date),
##D            exit = list(CAL = ex_date),
##D            data = sire[sire$dg_date < sire$ex_date, ],
##D            exit.status = factor(status, levels = 0:2, 
##D                                 labels = c("alive", "canD", "othD")), 
##D            merge = TRUE)
##D ## phony group variable
##D set.seed(1L)
##D x$group <- rbinom(nrow(x), 1, 0.5)
##D 
##D st <- survtab(Surv(time = FUT, event = lex.Xst) ~ group, data = x, 
##D               surv.type = "surv.obs",
##D               breaks = list(FUT = seq(0, 5, 1/12)*365.25))    
##D                   
##D ## NOTE: population hazard should be reported at the same scale
##D ## as time variables in your Lexis data.
##D data(popmort, package = "popEpi")
##D pm <- data.frame(popmort)
##D names(pm) <- c("sex", "CAL", "AGE", "haz")
##D ## from year to day level
##D pm$haz <- pm$haz/365.25 
##D pm$CAL <- as.Date(paste0(pm$CAL, "-01-01")) 
##D pm$AGE <- pm$AGE*365.25 
##D 
##D st <- survtab(Surv(time = FUT, event = lex.Xst) ~ group, data = x, 
##D               surv.type = "surv.rel", relsurv.method = "e2",
##D               pophaz = pm,
##D               breaks = list(FUT = seq(0, 5, 1/12)*365.25))  
## End(Not run)



