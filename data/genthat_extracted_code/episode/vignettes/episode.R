## ---- echo=FALSE,results='hide'------------------------------------------
# devtools::load_all()
set.seed(123)
library(episode)

## ------------------------------------------------------------------------
# Stoichiometric matrices of the Michaelis-Menten system
A <- matrix(
  c(1, 1, 0, 0,
    0, 0, 1, 0,
    0, 0, 1, 0), ncol = 4, byrow = TRUE)
B <- matrix(
  c(0, 0, 1, 0,
    1, 1, 0, 0,
    1, 0, 0, 1), ncol = 4, byrow = TRUE)
colnames(A) <- colnames(B) <- c("E", "S", "ES", "P")
m <- mak(A, B)
m

## ------------------------------------------------------------------------
# Initial state
x0 <- setNames(c(8, 10, 1.5, 1.5), colnames(m$A))
# Rate parameters
k <- c(2.1, 2.25, 1.5)
# Time discretisation
Time <- seq(0, 1, by = 0.1)

trajectory <- numsolve(m, time = Time, x0 = x0, param = k) 
trajectory

## ------------------------------------------------------------------------
field(m, x = x0, param = k) 

## ------------------------------------------------------------------------
solver("rk23")
p <- plk(A, s = solver("rk23")) 

## ------------------------------------------------------------------------
# Generated data
y <- trajectory
y[, -1] <- y[, -1] + matrix(rnorm(length(y[,-1]), sd = .5), nrow = nrow(y))

# Create optimisation object
op <- opt(y)

## ------------------------------------------------------------------------
# Create optimisation object, but only 10 lambda values
op <- opt(y, nlambda = 10)

## ------------------------------------------------------------------------
reg("elnet")
m <- mak(A, B, r = reg("elnet")) 

## ------------------------------------------------------------------------
# Generate intervened data with different initial state
y_int <- numsolve(m, time = Time, x0 = x0 + 1, param = k * c(1, 0, 1))  
y_int[, -1] <- y_int[, -1] + matrix(rnorm(length(y_int[,-1]), sd = .1), nrow = nrow(y_int))
y2 <- rbind(y, y_int)

# Create optimisation object with data from original system and intervened system
op2 <- opt(y2, nlambda = 10)

## ------------------------------------------------------------------------
# First column scales the parameter in the original system, the second in the intervened system
m2 <- mak(A, B, r = reg(contexts = cbind(1, c(1, 0, 1))))

## ------------------------------------------------------------------------
rod <- rodeo(m2, op2, x0 = NULL, params = NULL)
rod$params$rate

## ------------------------------------------------------------------------
a <- aim(m2, op2)
a$params$rate

## ------------------------------------------------------------------------
# Change regularisation type to "none"
a$o$rs$rate$reg_type <- "none"
rod <- rodeo(a)
rod$params$rate

## ------------------------------------------------------------------------
matrix(k, ncol = 1)

