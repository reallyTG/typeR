library(DynNom)


### Name: DynNom.coxph
### Title: Dynamic Nomograms for Proportional Hazards Models
### Aliases: DynNom.coxph
### Keywords: dynamic nomograms Cox Proportional Hazards Model individual
###   prediction shiny

### ** Examples

## Not run: 
##D data.kidney <- kidney
##D # always make sure that the categorical variables are in a factor class
##D data.kidney$sex <- as.factor(data.kidney$sex)
##D levels(data.kidney$sex) <- c("male", "female")
##D 
##D model1 <- coxph(Surv(time, status) ~ age + sex + disease, data.kidney)
##D DynNom(model1, data.kidney)
##D DynNom(model1, data.kidney, ptype = "1-st")
##D 
##D # a cox model including a strata term
##D data(lung)
##D model2 <- coxph(Surv(time, status) ~ age + strata(sex) + ph.ecog , data = lung)
##D DynNom(model2, lung)
## End(Not run)

if (interactive()) {
data.ovary <- ovarian
data.ovary$resid.ds <- as.factor(data.ovary$resid.ds)
levels(data.ovary$resid.ds) <- c("no", "yes")
data.ovary$rx <- as.factor(data.ovary$rx)
data.ovary$ecog.ps <- as.factor(data.ovary$ecog.ps)

model3 <- coxph(Surv(futime, fustat) ~ age + resid.ds * rx + ecog.ps, data = data.ovary)
DynNom(model3, data.ovary)
}



