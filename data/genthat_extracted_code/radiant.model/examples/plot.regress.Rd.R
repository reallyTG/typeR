library(radiant.model)


### Name: plot.regress
### Title: Plot method for the regress function
### Aliases: plot.regress

### ** Examples

result <- regress(diamonds, "price", c("carat", "clarity"))
plot(result, plots = "coef", conf_lev = .99, intercept = TRUE)
## Not run: 
##D plot(result, plots = "dist")
##D plot(result, plots = "scatter", lines = c("line", "loess"))
##D plot(result, plots = "resid_pred", lines = "line")
##D plot(result, plots = "dashboard", lines = c("line", "loess"))
## End(Not run)



