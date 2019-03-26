library(CAMAN)


### Name: bivariate.mixalg
### Title: EM algorithm and classification for univariate data, for
###   bivariate data and for meta data
### Aliases: ' bivariate.mixalg '
### Keywords: datasets

### ** Examples

## Not run: 
##D #1.EM and classification for bivariate data
##D #Examples
##D data(rs12363681)
##D test <- bivariate.mixalg(obs1=x, obs2=y, type="bi", 
##D                          lambda1=0, lambda2=0, p=0, 
##D                          data=rs12363681, startk=20, class="TRUE")
##D #scatter plot with ellipse
##D plot(test)
##D #scatter plot without ellipse
##D plot(test, ellipse = FALSE)
##D #2.EM and classification for meta data
##D #Examples
##D data(CT)
##D bivariate.mixalg(obs1=logitTPR, obs2=logitTNR, 
##D                  var1=varlogitTPR, var2=varlogitTNR,
##D                  type="meta", lambda1=0, lambda2=0,
##D                  p=0,data=CT,startk=20,class="TRUE")
## End(Not run)



