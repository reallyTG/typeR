library(spatstat)


### Name: plot.fasp
### Title: Plot a Function Array
### Aliases: plot.fasp
### Keywords: spatial hplot

### ** Examples

   ## Not run: 
##D    # Bramble Canes data.
##D    data(bramblecanes)
##D 
##D    X.G <- alltypes(bramblecanes,"G",dataname="Bramblecanes",verb=TRUE)
##D    plot(X.G)
##D    plot(X.G,subset="r<=0.2")
##D    plot(X.G,formule=asin(sqrt(cbind(km,theo))) ~ asin(sqrt(theo)))
##D    plot(X.G,fo=cbind(km,theo) - theo~r,subset="r<=0.2")
##D 
##D    # Simulated data.
##D    pp <- runifpoint(350, owin(c(0,1),c(0,1)))
##D    pp <- pp %mark% factor(c(rep(1,50),rep(2,100),rep(3,200)))
##D    X.K <- alltypes(pp,"K",verb=TRUE,dataname="Fake Data")
##D    plot(X.K,fo=cbind(border,theo)~theo,subset="theo<=0.75")
##D    
## End(Not run)



