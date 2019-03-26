library(episode)


### Name: field
### Title: Field of Ordinary Differential Equation (ODE) systems.
### Aliases: field

### ** Examples

# Example: Michaelis-Menten system
A <- matrix(
c(1, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 1, 0), ncol = 4, byrow = TRUE)
B <- matrix(
c(0, 0, 1, 0,
  1, 1, 0, 0,
  1, 0, 0, 1), ncol = 4, byrow = TRUE)
k <- c(1, 2, 0.5)
x <- c(E = 1, S = 4, ES = 0, P = 0)

m <- mak(A, B)

# Vector field
field(m, x, k)

# ... with differentials
field(m, x, k, TRUE)


# Example: Power law kinetics
A <- matrix(c(1, 0, 1,
              1, 1, 0), byrow = TRUE, nrow = 2)
p <- plk(A)
x <- c(10, 4, 1)
theta <- matrix(c(0, -0.25,
                  0.75, 0,
                  0, -0.1), byrow = TRUE, nrow = 3)

# Vector field
field(p, x, theta)

# ... with differentials
field(p, x, theta, TRUE)




