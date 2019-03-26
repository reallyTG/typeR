library(survminer)


### Name: ggcompetingrisks
### Title: Cumulative Incidence Curves for Competing Risks
### Aliases: ggcompetingrisks

### ** Examples

set.seed(2)
ss <- rexp(100)
gg <- factor(sample(1:3,100,replace=TRUE),1:3,c('BRCA','LUNG','OV'))
cc <- factor(sample(0:2,100,replace=TRUE),0:2,c('no event', 'death', 'progression'))
strt <- sample(1:2,100,replace=TRUE)

# handles cuminc objects
print(fit <- cmprsk::cuminc(ss,cc,gg,strt))
ggcompetingrisks(fit)
ggcompetingrisks(fit, multiple_panels = FALSE)
ggcompetingrisks(fit, conf.int = TRUE)
ggcompetingrisks(fit, multiple_panels = FALSE, conf.int = TRUE)

# handles survfitms objects
library(survival)
df <- data.frame(time = ss, group = gg, status = cc, strt)
fit2 <- survfit(Surv(time, status, type="mstate") ~ 1, data=df)
ggcompetingrisks(fit2)
fit3 <- survfit(Surv(time, status, type="mstate") ~ group, data=df)
ggcompetingrisks(fit3)
## Not run: 
##D   library(ggsci)
##D   library(cowplot)
##D   ggcompetingrisks(fit3) + theme_cowplot() + scale_fill_jco()
## End(Not run)



