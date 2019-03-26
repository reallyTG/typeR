library(MuMIn)


### Name: QIC
### Title: QIC and quasi-Likelihood for GEE
### Aliases: QIC QICu quasiLik
### Keywords: models

### ** Examples

## Don't show: 
 if(require(geepack)) { 
## End(Don't show)

data(ohio)

fm1 <- geeglm(resp ~ age * smoke, id = id, data = ohio,
    family = binomial, corstr = "exchangeable", scale.fix = TRUE)
fm2 <- update(fm1, corstr = "ar1")
fm3 <- update(fm1, corstr = "unstructured")

model.sel(fm1, fm2, fm3, rank = QIC)

## Not run: 
##D # same result:
##D     dredge(fm1, m.lim = c(3, NA), rank = QIC, varying = list(
##D     corstr = list("exchangeable", "unstructured", "ar1")
##D     ))      
## End(Not run)
## Don't show: 
 } 
## End(Don't show)




