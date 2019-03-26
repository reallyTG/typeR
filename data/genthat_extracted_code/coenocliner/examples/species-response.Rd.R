library(coenocliner)


### Name: species-response
### Title: Species response models for coenocline simulation
### Aliases: Beta Gaussian species-response
### Keywords: datagen

### ** Examples


# A simple example with a single species
x <- seq(from = 4, to = 6, length = 100)
px <- list(opt = 4.5, tol = 0.25, h = 20)
G <- Gaussian(x, px = px)
head(G)
length(G)

# A more complex example with 6 species, which needs the parameters
# repeating for each gradient location:

# Recreate Fig. 2 of Minchin (1987)
# Parameters for each of 6 six species
A0 <- c(5,4,7,5,9,8) * 10
m <- c(25,85,10,60,45,60)
r <- c(3,3,4,4,6,5) * 10
alpha <- c(0.1,1,2,4,1.5,1)
gamma <- c(0.1,1,2,4,0.5,4)
# Gradient locations
x <- 1:100

# expand parameter set
pars <- expand(x, m = m, A0 = A0, r = r, alpha = alpha,
gamma = gamma)
head(pars)

xvec <- pars[, "x"]
px <- as.list(data.frame(pars[, -1]))
spprc <- Beta(xvec, px = px)
matplot(matrix(spprc, ncol = 6), ## 6 species
        type = "l", lty = "solid")

# Bivariate beta, single species
xx <- 1:100
yy <- 1:100
xy <- expand.grid(x = xx, y = yy)
parx <- expand(xy[, "x"], A0 = 50, m = 60, r = 40, alpha = 4, gamma = 4)
pary <- expand(xy[, "y"], m = 60, r = 40, alpha = 4, gamma = 4)

x <- parx[,1]
px <- as.list(as.list(data.frame(parx[, -1])))
y <- pary[,1]
py <- as.list(as.list(data.frame(pary[, -1])))

spprc <- Beta(x, y, px = px, py = py)
persp(xx, yy, matrix(spprc, ncol = length(xx)))



