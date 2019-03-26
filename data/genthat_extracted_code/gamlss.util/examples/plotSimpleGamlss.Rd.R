library(gamlss.util)


### Name: plotSimpleGamlss
### Title: Plotting a simple GAMLSS model for demonstration purpose
### Aliases: plotSimpleGamlss
### Keywords: regression

### ** Examples

## the abdominal data
m1 <- gamlss(y~pb(x), sigma.fo=~pb(x), data=abdom, family=LO)
plotSimpleGamlss(y,x, model=m1,   data=abdom, x.val=seq(15, 40, 5), 
                    ylim=c(0, 450), xlim=c(5, 45))
data(species)
species$ll <- log(species$lake)
m2 <- gamlss(fish~ll, data=species, trace=FALSE, family=PO )
plotSimpleGamlss(fish,ll, model=m2,   data=species, x.val=c(3,5,7, 9),
                  val=20, N=100, ylim=c(0,80))
 m3 <- gamlss(fish~ll, data=species, trace=FALSE, family=NBI, sigma.fo=~ll )
plotSimpleGamlss(fish,ll, model=m3,   data=species, x.val=c(3,5,7, 9),
                    val=20, N=100, ylim=c(0,100))
## Not run: 
##D ##------------------------------------------------------------------------------
##D ## the rent data 
##D ## fitting the model first 
##D r1 <- gamlss(R~pb(Fl), sigma.fo=~pb(Fl),data=rent, family=GA, ylim=c(0, 3000))
##D ## plot 1
##D plotSimpleGamlss(R,Fl, model=r1,   data=rent, x.val=seq(40,120, 5))
##D ## plot 2 finer grid 
##D plotSimpleGamlss(R,Fl, model=r1,   data=rent, x.val=seq(40,120, 1), 
##D                   xlim=c(10,120))
##D ##  the same but fitting the model within the function
##D ## note that sigma formula has to be specified 
##D plotSimpleGamlss(R,Fl, formula= R~pb(Fl),   family=GA, data=rent, 
##D                     x.val=seq(40,120, 5), sigma.fo=~pb(Fl))
##D #------------------------------------------------------------------------------
## End(Not run)



