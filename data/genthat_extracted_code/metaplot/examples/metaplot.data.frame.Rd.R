library(metaplot)


### Name: metaplot.data.frame
### Title: Create Metaplot for Data Frame.
### Aliases: metaplot.data.frame

### ** Examples

## Not run: 
##D library(magrittr)
##D library(dplyr)
##D library(csv)
##D library(nlme)
##D x <- Theoph
##D 
##D # mixed effects model
##D m1 <- nlme(
##D   conc ~ SSfol(Dose, Time, lKe, lKa, lCl),
##D   data = x,
##D   fixed = lKe + lKa + lCl ~ 1,
##D   random = lKe + lKa + lCl ~ 1
##D )
##D 
##D # some numeric and categorical properties
##D names(x) <- tolower(names(x))
##D x %<>% mutate(arm = ifelse(as.numeric(as.character(subject)) %% 2 == 0, 1, 2))
##D x %<>% mutate(site = ifelse(as.numeric(as.character(subject)) < 6, 1, 2))
##D x %<>% mutate(cohort = ifelse(as.numeric(as.character(subject)) %in% c(1:2,6:8), 1,2))
##D x %<>% mutate(pred = predict(m1,level = 0) %>% signif(4))
##D x %<>% mutate(ipred = predict(m1) %>% signif(4))
##D x %<>% mutate(res = residuals(m1) %>% signif(4))
##D x %<>% mutate(sres = residuals(m1, type = 'pearson') %>% signif(4))
##D r <- ranef(m1) %>% signif(4)
##D r$subject <- rownames(r)
##D x %<>% left_join(r)
##D # metadata
##D attr(x$subject,'label') <- 'subject identifier'
##D attr(x$wt,'label') <- 'subject weight'
##D attr(x$dose,'label') <- 'theophylline dose'
##D attr(x$time,'label') <- 'time since dose administration'
##D attr(x$conc,'label') <- 'theophylline concentration'
##D attr(x$arm,'label') <- 'trial arm'
##D attr(x$site,'label') <- 'investigational site'
##D attr(x$cohort,'label') <- 'recruitment cohort'
##D attr(x$pred,'label') <- 'population-predicted concentration'
##D attr(x$ipred,'label') <- 'individual-predicted concentration'
##D attr(x$res,'label') <- 'residuals'
##D attr(x$sres,'label') <- 'standardized residuals'
##D attr(x$lKe,'label') <- 'natural log of elimination rate constant'
##D attr(x$lKa,'label') <- 'natural log of absorption rate constant'
##D attr(x$lCl,'label') <- 'natural log of clearance'
##D attr(x$subject,'guide') <- '....'
##D attr(x$wt,'guide') <- 'kg'
##D attr(x$dose,'guide') <- 'mg/kg'
##D attr(x$time,'guide') <- 'h'
##D attr(x$conc,'guide') <- 'mg/L'
##D attr(x$arm,'guide') <- '//1/Arm A//2/Arm B//'
##D attr(x$site,'guide') <- '//1/Site 1//2/Site 2//'
##D attr(x$cohort,'guide') <- '//1/Cohort 1//2/Cohort 2//'
##D attr(x$pred,'guide') <- 'mg/L'
##D attr(x$ipred,'guide') <- 'mg/L'
##D 
##D attr(x$lKe,'reference') <- 0
##D attr(x$lKa,'reference') <- 0
##D attr(x$lCl,'reference') <- 0
##D attr(x$res,'reference') <- 0
##D attr(x$sres,'reference') <- '//-1.96//1.96//'
##D 
##D attr(x$subject,'symbol') <- 'ID_i'
##D attr(x$wt,'symbol') <- 'W_i'
##D attr(x$dose,'symbol') <- 'A_i'
##D attr(x$time,'symbol') <- 't_i,j'
##D attr(x$conc,'symbol') <- 'C_i,j'
##D attr(x$arm,'symbol') <- 'Arm_i'
##D attr(x$site,'symbol') <- 'Site_i'
##D attr(x$cohort,'symbol') <- 'Cohort_i'
##D attr(x$pred,'symbol') <- 'C_pred_p'
##D attr(x$ipred,'symbol') <- 'C_pred_i'
##D attr(x$res,'symbol') <- '\\epsilon'
##D attr(x$sres,'symbol') <- '\\epsilon_st'
##D attr(x$lKe,'symbol') <- 'ln(K_e.)'
##D attr(x$lKa,'symbol') <- 'ln(K_a.)'
##D attr(x$lCl,'symbol') <- 'ln(Cl_c./F)'
##D 
##D 
##D x %>% unpack %>% as.csv('theoph.csv')
## End(Not run)
## Don't show: 
## Not run: 
##D y <- x
##D y[] <- lapply(y, as.character)
##D y[] <- lapply(y, as.numeric)
##D y$arm <- as.factor(y$arm)
##D y$site <- as.factor(y$site)
##D y$subject <- as.factor(y$subject)
##D y %>% metaplot(conc)
##D y %>% metaplot(site)
##D y %>% metaplot(wt, arm)
##D y %>% metaplot(arm, wt)
##D y %>% metaplot(arm, wt,site)
##D y %>% metaplot(conc, time)
##D y %>% metaplot(arm, site)
##D y %>% metaplot(conc, time, subject)
##D y %>% metaplot(conc, time, , subject)
##D y %>% metaplot(conc, time, subject, site)
##D y %>% metaplot(conc, time, subject, site, arm)
##D y %>% metaplot(lKe, lKa, lCl)
##D y %>% scatter(conc, ipred, time)
##D y %>% scatter(conc, ipred, time, subject)
##D x %>% metaplot(conc, ipred, time, subject, colors = 'black', points = c(T,F), lines = c(F,T))
##D y %>% scatter(conc, ipred, time, site, arm)
##D y %<>% mutate(time = ifelse(time > 15, NA, time))
##D y %>% scatter(conc, ipred, time, site, arm)
## End(Not run)## End(Don't show)




