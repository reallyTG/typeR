library(cenGAM)


### Name: tobit1
### Title: Tobit I family for censored GAM
### Aliases: tobit1

### ** Examples

# Generate random data
set.seed(1)
x <- matrix(2*rnorm(300), 100)
yn <- 2*x[,3] + 4*cos(x[,1]*2)
y <- yn + rnorm(100)
ycensored <- pmax(y, 0) # data left-censored at 0
ycensored <- pmin(ycensored, 4) # data right-censored at 4

par(mfrow = c(3,3))

# True model
plot(gam(y ~ s(x[,1]) + s(x[,2]) + s(x[, 3])), ylim=c(-5, 5), main = "True")

# Naive estimation
plot(gam(ycensored ~ s(x[,1]) + s(x[,2]) + s(x[, 3])), ylim=c(-5, 5), main = "Naive")

# Tobit I estimation
m <- gam(ycensored ~ s(x[,1]) + s(x[,2]) + s(x[, 3]), family = tobit1(left.threshold=0))
summary(m) #note x[,2] is not significant
m$family$getTheta(FALSE) #estimate of theta
m$family$getTheta(TRUE) #estimate of sigma = exp(theta)
plot(m, ylim = c(-5, 5), main = "Tobit I") 

# More realistic dataset requires some data processing
data(nutrient)
# For this dataset, all values >1 are censored. At location D values are censored below at 0, other
# locations are censored at 0.1.
head(nutrient)
nut = data.frame(day = nutrient$day, location = factor(nutrient$location), y=as.numeric(nutrient$y))
table(nutrient$y[is.na(nut$y)])
summary(nut$y)
nut$upper = 10
nut$lower = ifelse(nut$location == "D", 0, 1)
# Recode the data to communicate which is and isn't censored
nut$y[nutrient$y %in% c("<1", "<0")] = -Inf
nut$y[nutrient$y %in% c(">10")] = Inf
# Missing values are best removed here, or can cause confusion later
nut = na.omit(nut)

# Fit including a random effect for location
m = gam(y~ s(day) + s(location, bs="re") , data = nut, 
family = tobit1(left.threshold=nut$lower, right.threshold = nut$upper))

gam.vcomp(m)
anova(m)
summary(m)




