library(lavaSearch2)


### Name: selectResponse
### Title: Response Variable of a Formula
### Aliases: selectResponse selectResponse.formula
### Keywords: internal

### ** Examples


## Not run: 
##D 
##D selectResponse <- lavaSearch2:::selectResponse
##D selectResponse.formula <- lavaSearch2:::selectResponse.formula
##D 
##D selectResponse(Y1~X1+X2)
##D selectResponse(Y1~X1+X2, format = "vars")
##D selectResponse(Surv(event,time)~X1+X2, format = "vars")
##D 
##D selectResponse(Y1~X1+Y1)
##D selectResponse(Y1+Y2~X1+Y1, format = "vars")
##D 
##D selectResponse(~X1+X2)
##D selectResponse(~X1+X2, format = "vars")
## End(Not run)




