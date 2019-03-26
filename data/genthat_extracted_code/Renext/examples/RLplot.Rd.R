library(Renext)


### Name: RLplot
### Title: Return level plot
### Aliases: RLplot

### ** Examples

## Typical probability vector
prob <- c(0.0001,
  seq(from = 0.01, to = 0.09, by = 0.01),
  seq(from = 0.10, to = 0.80, by = 0.10),
  seq(from = 0.85, to = 0.99, by = 0.01),
  0.995, 0.996, 0.997, 0.998, 0.999, 0.9995)

## Model parameters rate = #evts by year, over nyear
lambda <- 4
nyear <- 30
theta.x <- 4

## draw points
n.x <- rpois(1, lambda = lambda*nyear)
x <- rexp(n.x, rate = 1/theta.x)

## ML estimation (exponential)
lambda.hat <- n.x / nyear
theta.x.hat <- mean(x)
  
## Compute bounds (here exact)
alpha <- 0.05

quant <- qexp(p = prob, rate = 1/theta.x.hat) 

theta.L <- 2*n.x*theta.x.hat / qchisq(1 - alpha/2, df = 2*n.x)
theta.U <- 2*n.x*theta.x.hat / qchisq(alpha/2, df = 2*n.x)

L.95 <- qexp(p = prob, rate = 1/theta.L) 
U.95 <- qexp(p = prob, rate = 1/theta.U) 

## store in data.frame object
data <- data.frame(prob = prob, quant = quant, L.95 = L.95, U.95 = U.95)

RLplot(data = data, x = x, lambda = lambda.hat,
       duration = nyear,
       main = "Poisson-exponential return levels")

RLplot(data = data, x = x, lambda = lambda.hat, duration = nyear,
       mark.rl = 10, mark.labels = "10 ans", mono = FALSE, mark.col = "SeaGreen",
       main = "Poisson-exponential return levels")

points(x = log(50), y = 25, pch = 18, cex = 1.4, col = "purple") 
text(x = log(50), y = 25, col ="purple", pos = 4, labels = "special event") 




