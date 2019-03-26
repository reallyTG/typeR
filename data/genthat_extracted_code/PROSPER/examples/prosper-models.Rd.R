library(PROSPER)


### Name: prosper-models
### Title: Population dynamic models - Examples
### Aliases: prosper-models param.ECHCG param.GALAP param.LOLRI
###   prosper.ECHCG prosper.GALAP prosper.LOLRI

### ** Examples

mod_echcg <- prosper.ECHCG(param.weed = param.ECHCG, area=100, af=c(0.001),
                             undersowing=0.2,dom=0.5,duration=7,repetitions=1)


## Not run: 
##D #The model call for Redwitz et al. (2015)
##D undersowing_prob <- c(1, 0.3, 0) #no undersowing, strong competition, complete dominance
##D years <- 20
##D reps  <- 4
##D ####------------------------
##D simu_collect <- list()
##D for(simu in 1:3){
##D simu_collect[[simu]] <- prosper.ECHCG(area          = 100,
##D                                       param.weed    = param.ECHCG,
##D                                       thresh        = 20,
##D                                       duration      = years,
##D                                       af            = 0.001,     
##D                                       dom           = 1,      
##D                                       undersowing   = undersowing_prob[simu],  
##D                                       repetitions   = reps
##D                                              )
##D }
## End(Not run)
## Not run: 
##D    
##D data(param.GALAP)
##D mod_galap <- prosper.GALAP(param.weed=param.GALAP, repetitions=2, duration=10) 
## End(Not run)
## Not run: 
##D mod_lolri    <- prosper.LOLRI(param.weed=param.LOLRI, area=100, 
##D                                        duration=15, repetitions=3)
## End(Not run)




