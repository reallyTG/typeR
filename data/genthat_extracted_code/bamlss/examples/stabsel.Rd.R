library(bamlss)


### Name: stabsel
### Title: Stability selection.
### Aliases: stabsel plot.stabsel
### Keywords: model selection

### ** Examples

## Not run: 
##D ## Simulate some data.
##D d <- GAMart()
##D n <- nrow(d)
##D 
##D ## Add some noise variables.
##D for(i in 4:9)
##D   d[[paste0("x",i)]] <- rnorm(n)
##D 
##D f <- paste0("~ ", paste("s(x", 1:9, ")", collapse = "+", sep = ""))
##D f <- paste(f, "+ te(lon,lat)")
##D f <- eval(parse(text = f))
##D f <- list(update(f, num ~ .), f)
##D 
##D ## Run stability selection.
##D sel <- stabsel(f, data = d, q = 6, B = 10)
##D plot(sel)
##D 
##D ## Estimate selected model.
##D b <- bamlss(sel$formula.new, data = d)
##D plot(b)
## End(Not run)



