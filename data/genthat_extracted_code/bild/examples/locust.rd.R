library(bild)


### Name: locust
### Title: Locust
### Aliases: locust
### Keywords: datasets

### ** Examples

str(locust)


####  dependence="MC2"
locust2_feed1 <- bild(move~(time+I(time^2))*sex, data=locust, 
   subSET=feed=="1", aggregate=sex, dependence="MC2")

summary(locust2_feed1)

plot(locust2_feed1, which=5, ylab="probability of locomoting", 
    main="Feed=1", add.unadjusted=TRUE)

locust2 <- bild(move~(time+I(time^2))*feed, data=locust,  
        aggregate=feed, dependence="MC2")

par(mfrow=c(2,2))
plot(locust2, which=1)
plot(locust2, which=2)
plot(locust2, which=3)
plot(locust2, which=4)
par(mfrow=c(1,1))

plot(locust2, which=5, ylab="probability of locomoting", 
    add.unadjusted=TRUE)




