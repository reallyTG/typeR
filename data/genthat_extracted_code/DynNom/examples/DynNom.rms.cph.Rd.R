library(DynNom)


### Name: DynNom.cph
### Title: Dynamic Nomograms for Cox Proportional Hazards Models from the
###   'rms' package
### Aliases: DynNom.cph
### Keywords: dynamic nomograms cox proportional hazards model individual
###   prediction shiny

### ** Examples

## Not run: 
##D # example 1
##D data = veteran
##D model1 <- cph((Surv(log(time), status)) ~ rcs(age, 4) * strat(trt) +
##D               diagtime * strat(prior) + lsp(karno, 60), data = veteran)
##D model1 <- update(model1, x = T, y = T, surv = T)
##D DynNom.cph(model1, data)
##D DynNom(model1, data, ptype = "1-st")
##D 
##D # example 2
##D data(lung)
##D sfit = Surv(lung$time, lung$status)
##D model2 <- cph(sfit ~ age + strat(sex) + ph.ecog , data = lung)
##D DynNom.cph(model2, lung)
## End(Not run)

if (interactive()) {
data.ovary <- ovarian
data.ovary$resid.ds <- as.factor(data.ovary$resid.ds)
levels(data.ovary$resid.ds) <- c("no", "yes")
data.ovary$rx <- as.factor(data.ovary$rx)
data.ovary$ecog.ps <- as.factor(data.ovary$ecog.ps)

model3 <- cph(Surv(futime, fustat) ~ age + resid.ds * rx + ecog.ps, data = data.ovary)
DynNom(model3, data.ovary)
}



