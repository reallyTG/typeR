library(beyondWhittle)


### Name: scree_type_ar
### Title: Negative log AR likelihood values for scree-type plots
### Aliases: scree_type_ar

### ** Examples

## Not run: 
##D 
##D ###
##D ### Interactive visual inspection for the sunspot data
##D ###
##D 
##D data <- sqrt(as.numeric(sunspot.year))
##D data <- data <- data - mean(data)
##D 
##D screeType <- scree_type_ar(data, order.max=15)
##D 
##D # Determine the autoregressive order by an interactive visual inspection of the scree-type plot
##D plot(x=screeType$p, y=screeType$nll, type="b")
##D p_ind <- identify(x=screeType$p, y=screeType$nll, n=1, labels=screeType$p)
##D print(screeType$p[p_ind])
## End(Not run)



