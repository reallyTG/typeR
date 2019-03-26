library(bild)


### Name: plot-methods
### Title: Methods for Function plot in Package "bild"
### Aliases: plot-methods plot,bild,missing-method
### Keywords: methods

### ** Examples
## No test: 
 
## It takes a very long time to run
str(locust)

####  dependence="MC2R"
Integ <- bildIntegrate(li=-2.5,ls=2.5, lig=-2.5, lsg=2.5)   
locust2r_feed1 <- bild(move~(time+I(time^2))*sex, data=locust, 
    subSET=feed=="1", aggregate=sex, dependence="MC2R",  
    integrate=Integ)
    


summary(locust2r_feed1)

plot(locust2r_feed1, which=5, ylab="probability of locomoting",
     add.unadjusted=TRUE)

plot(locust2r_feed1, which=6, subSET=sex=="1", 
    main="sex==1 & Feed=1", ident=TRUE)

locust2r <- bild(move~(time+I(time^2))*feed,data=locust, 
    trace=TRUE, aggregate=feed, dependence="MC2R", 
    integrate=Integ)

par(mfrow=c(2,2))
plot(locust2r, which=1)
plot(locust2r, which=2)
plot(locust2r, which=3)
plot(locust2r, which=4)
par(mfrow=c(1,1))

plot(locust2r, which=5, ylab="probability of locomoting", 
    main="Feed & Unfeed groups", add.unadjusted=TRUE)

plot(locust2r, which=6, ylab="probability of locomoting",
    main="Fed & Unfed groups", ident=TRUE)
## End(No test)


