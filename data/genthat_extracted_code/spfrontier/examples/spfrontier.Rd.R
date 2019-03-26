library(spfrontier)


### Name: spfrontier
### Title: Spatial stochastic frontier model
### Aliases: spfrontier
### Keywords: frontier spatial stochastic

### ** Examples


data( airports )
airports2011 <- subset(airports, Year==2011)
W <- constructW(cbind(airports2011$longitude, airports2011$latitude),airports2011$ICAO)
formula <- log(PAX) ~ log(Population100km) + log(Routes) + log(GDPpc)
ols <- lm(formula , data=airports2011)
summary(ols )
plot(density(stats::residuals(ols)))
skewness(stats::residuals(ols))

# Takes >5 sec, see demo for more examples
# model <- spfrontier(formula , data=airports2011)
# summary(model )

# model <- spfrontier(formula , data=airports2011, W_y=W)
# summary(model )




