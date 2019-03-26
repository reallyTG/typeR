library(eeptools)


### Name: gelmansim
### Title: Generate prediction intervals for model functions
### Aliases: gelmansim

### ** Examples

 #Examples of "sim" 
set.seed (1)
J <- 15
n <- J*(J+1)/2
group <- rep (1:J, 1:J)
mu.a <- 5
sigma.a <- 2
a <- rnorm (J, mu.a, sigma.a)
b <- -3
x <- rnorm (n, 2, 1)
sigma.y <- 6
y <- rnorm (n, a[group] + b*x, sigma.y)
u <- runif (J, 0, 3)
y123.dat <- cbind (y, x, group)
# Linear regression 
x1 <- y123.dat[,2]
y1 <- y123.dat[,1]
M1 <- glm (y1 ~ x1)

cases <- data.frame(x1 = seq(-2, 2, by=0.1))
sim.results <- gelmansim(M1, newdata=cases, n.sims=200, na.omit=TRUE)
## Not run: 
##D 
##D dat <- as.data.frame(y123.dat)
##D M2 <- glm (y1 ~ x1 + group, data=dat)
##D 
##D cases <- expand.grid(x1 = seq(-2, 2, by=0.1), 
##D                      group=seq(1, 14, by=2))
##D 
##D sim.results <- gelmansim(M2, newdata=cases, n.sims=200, na.omit=TRUE)
##D  
## End(Not run)



