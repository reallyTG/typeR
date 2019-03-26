library(BradleyTerry2)


### Name: residuals.BTm
### Title: Residuals from a Bradley-Terry Model
### Aliases: residuals.BTm
### Keywords: models

### ** Examples


##
##  See ?springall
##
springall.model <- BTm(cbind(win.adj, loss.adj),
                       col, row, 
                       ~ flav[..] + gel[..] + 
                       flav.2[..] + gel.2[..] + flav.gel[..] + (1 | ..),
                       data = springall)
res <- residuals(springall.model, type = "grouped")
with(springall$predictors, plot(flav, res))
with(springall$predictors, plot(gel, res))
##  Weighted least-squares regression of these residuals on any variable
##  already included in the model yields slope coefficient zero:
lm(res ~ flav, weights = attr(res, "weights"),
   data = springall$predictors)
lm(res ~ gel, weights = attr(res, "weights"),
   data = springall$predictors)




