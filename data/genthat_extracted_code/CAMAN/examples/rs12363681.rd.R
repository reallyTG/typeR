library(CAMAN)


### Name: rs12363681
### Title: Gene calling
### Aliases: rs12363681
### Keywords: datasets

### ** Examples

## Not run: 
##D # Example
##D # EM and classification for bivariate data
##D data(rs12363681)
##D test <- bivariate.mixalg(obs1=x, obs2=y, type="bi", 
##D                          lambda1=0, lambda2=0, p=0, 
##D                          data=rs12363681, startk=20, class="TRUE")
##D # scatter plot with ellipse
##D plot(test)
##D # scatter plot without ellipse
##D plot(test, ellipse = FALSE)
## End(Not run)



