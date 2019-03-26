library(scdhlm)


### Name: g_REML
### Title: Calculates adjusted REML effect size
### Aliases: g_REML

### ** Examples

data(Laski)
Laski_RML <- lme(fixed = outcome ~ treatment, 
                 random = ~ 1 | case, 
                 correlation = corAR1(0, ~ time | case), 
                 data = Laski)
summary(Laski_RML)
g_REML(Laski_RML, p_const = c(0,1), r_const = c(1,0,1), returnModel=FALSE)

data(Schutte)
Schutte$trt.week <- with(Schutte, unlist(tapply((treatment=="treatment") * week, 
         list(treatment,case), function(x) x - min(x))) + (treatment=="treatment"))
Schutte$week <- Schutte$week - 9
Schutte_RML <- lme(fixed = fatigue ~ week + treatment + trt.week, 
                   random = ~ week | case, 
                   correlation = corAR1(0, ~ week | case), 
                   data = subset(Schutte, case != 4))
summary(Schutte_RML)
Schutte_g <- g_REML(Schutte_RML, p_const = c(0,0,1,7), r_const = c(1,0,1,0,0))
summary(Schutte_g)



