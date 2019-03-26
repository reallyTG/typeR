library(betaboost)


### Name: betaboost
### Title: Function for boosting beta regression
### Aliases: betaboost

### ** Examples


#---------- data example 

data(QoLdata)

## Model for mu  
b1 <- betaboost(formula = QoL ~ arm + pain, data = QoLdata, 
                iterations = 500)

# Coeficients
coef(b1, off2int = TRUE)

# Phi
nuisance(b1)

## Model for mu and phi
b2 <- betaboost(formula = QoL ~ arm + pain, data = QoLdata, 
                iterations = 1000,
                phi.formula = QoL ~ arm + pain)


# Coeficients
coef(b2, off2int = TRUE)

#--------- simple simulated example

require(gamlss.dist)
set.seed(1234)
x1 <- rnorm(100)
x2 <- rnorm(100)
x3 <- rnorm(100)
x4 <- rnorm(100)
y <- rBE(n = 100, mu = plogis(x1 + x2),
                  sigma = plogis(x3 + x4))
data <- data.frame(y ,x1, x2, x3, x4)
data <- data[!data$y %in% c(0,1),]

# 'classic' beta regression
b3 <- betaboost(formula = y ~ x1 + x2, data = data,
                iterations = 120)
coef(b3)

# beta regression including modeled precision parameter
b4 <- betaboost(formula = y ~ x1 + x2, 
                phi.formula = y ~ x3 + x4, 
                data = data, iterations = 120)


# with smooth effects for x1 and x3
b5 <- betaboost(formula = y ~ s(x1) + x2, 
                phi.formula = y ~ s(x3) + x4, form.type = "classic",
                data = data, iterations = 120)          


# using matrix interface
b6 <- betaboost(y = data$y, x = data[,2:5], iterations = 200, 
                mat.parameter = "both")          





