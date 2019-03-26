library(survminer)


### Name: ggflexsurvplot
### Title: Ggplots of Fitted Flexible Survival Models
### Aliases: ggflexsurvplot

### ** Examples

## No test: 
if(require("flexsurv")) {
fit <- flexsurvreg(Surv(rectime, censrec) ~ group,
                   dist = "gengamma", data = bc)
ggflexsurvplot(fit)
}
## End(No test)




