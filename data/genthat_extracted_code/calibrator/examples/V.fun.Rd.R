library(calibrator)


### Name: V.fun
### Title: Variance matrix for observations
### Aliases: V.fun
### Keywords: array

### ** Examples

data(toys)
(jj <-V.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, 
  extractor=extractor.toy, 
  Edash.theta=Edash.theta.toy,
  E.theta=E.theta.toy,  phi=phi.toy))


## Now note that V.fun() changes with the PRIOR used for theta:
phi.different.theta <-  phi.change(old.phi=phi.toy,
     theta.apriori.mean=c(100,100,100),phi.fun=phi.fun.toy)
V.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, 
  extractor=extractor.toy, 
  Edash.theta=Edash.theta.toy,
  E.theta=E.theta.toy,  phi=phi.different.theta)
## different!


## Now compare jj above with V.fun() calculated with
## different phi2:

phi.toy.new <- phi.change(phi.fun=phi.fun.toy, old.phi = phi.toy, psi2=c(8,8,8))

V.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, 
  extractor=extractor.toy, 
  Edash.theta=Edash.theta.toy,
  E.theta=E.theta.toy,  phi=phi.toy.new)

## different!



## Not run: 
##D data(toys)
##D set.seed(0)
##D jj <- create.new.toy.datasets(D1=D1.toy , D2=D2.toy)
##D y.toy <- jj$y.toy
##D z.toy <- jj$z.toy
##D d.toy <- jj$d.toy
##D 
##D v.fun <- function(...){V.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, 
##D      extractor=extractor.toy, Edash.theta=Edash.theta.toy,
##D      E.theta=E.theta.toy, phi=phi.toy, give=TRUE)}
##D 
##D Rprof(file="~/f.txt");ignore <- v.fun();Rprof(file=NULL)
##D system("cd ; R CMD Rprof ~/f.txt > ~/ff.txt")
## End(Not run)



