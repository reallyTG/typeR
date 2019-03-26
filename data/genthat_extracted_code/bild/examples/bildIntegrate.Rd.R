library(bild)


### Name: bildIntegrate
### Title: Auxiliary for Controlling "bild" Fitting
### Aliases: bildIntegrate
### Keywords: function

### ** Examples
 ## No test: 
 
## It takes a very long time to run

####  data=locust, dependence="MC2R"                                                   
str(locust)                                                                            
                                                                                       
Integ <- bildIntegrate(li=-2.5,ls=2.5, lig=-2.5, lsg=2.5)                              
locust2r_feed1 <- bild(move~(time+I(time^2))*sex, data=locust,              
    trace=TRUE, subSET=feed=="1", aggregate=sex, dependence="MC2R",                    
    integrate=Integ)                                                                   
                                                                                       
summary(locust2r_feed1)                                                                
getAIC(locust2r_feed1)                                                                 
getLogLik(locust2r_feed1)                                                              
plot(locust2r_feed1)                                                                   
## End(No test)


