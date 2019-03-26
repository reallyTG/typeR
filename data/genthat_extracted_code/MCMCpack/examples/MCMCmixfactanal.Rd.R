library(MCMCpack)


### Name: MCMCmixfactanal
### Title: Markov Chain Monte Carlo for Mixed Data Factor Analysis Model
### Aliases: MCMCmixfactanal
### Keywords: models

### ** Examples


## Not run: 
##D data(PErisk)
##D 
##D post <- MCMCmixfactanal(~courts+barb2+prsexp2+prscorr2+gdpw2,
##D                         factors=1, data=PErisk,
##D                         lambda.constraints = list(courts=list(2,"-")),
##D                         burnin=5000, mcmc=1000000, thin=50,
##D                         verbose=500, L0=.25, store.lambda=TRUE,
##D                         store.scores=TRUE, tune=1.2)
##D plot(post)
##D summary(post)
##D 
##D 
##D 
##D 
##D library(MASS)
##D data(Cars93)
##D attach(Cars93)
##D new.cars <- data.frame(Price, MPG.city, MPG.highway,
##D                  Cylinders, EngineSize, Horsepower,
##D                  RPM, Length, Wheelbase, Width, Weight, Origin)
##D rownames(new.cars) <- paste(Manufacturer, Model)
##D detach(Cars93)
##D 
##D # drop obs 57 (Mazda RX 7) b/c it has a rotary engine
##D new.cars <- new.cars[-57,]
##D # drop 3 cylinder cars
##D new.cars <- new.cars[new.cars$Cylinders!=3,]
##D # drop 5 cylinder cars
##D new.cars <- new.cars[new.cars$Cylinders!=5,]
##D 
##D new.cars$log.Price <- log(new.cars$Price)
##D new.cars$log.MPG.city <- log(new.cars$MPG.city)
##D new.cars$log.MPG.highway <- log(new.cars$MPG.highway)
##D new.cars$log.EngineSize <- log(new.cars$EngineSize)
##D new.cars$log.Horsepower <- log(new.cars$Horsepower)
##D 
##D new.cars$Cylinders <- ordered(new.cars$Cylinders)
##D new.cars$Origin    <- ordered(new.cars$Origin)
##D 
##D 
##D 
##D post <- MCMCmixfactanal(~log.Price+log.MPG.city+
##D                  log.MPG.highway+Cylinders+log.EngineSize+
##D                  log.Horsepower+RPM+Length+
##D                  Wheelbase+Width+Weight+Origin, data=new.cars,
##D                  lambda.constraints=list(log.Horsepower=list(2,"+"),
##D                  log.Horsepower=c(3,0), weight=list(3,"+")),
##D                  factors=2,
##D                  burnin=5000, mcmc=500000, thin=100, verbose=500,
##D                  L0=.25, tune=3.0)
##D plot(post)
##D summary(post)
##D 
## End(Not run)




