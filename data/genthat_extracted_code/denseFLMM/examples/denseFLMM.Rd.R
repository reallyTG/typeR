library(denseFLMM)


### Name: denseFLMM
### Title: Functional Linear Mixed Models for Densely Sampled Data
### Aliases: denseFLMM
### Keywords: FPCA models,

### ** Examples

# fit model with group-specific functional random intercepts for two groups
# and a non group-specific smooth error, i.e., G = 2, H = 1.

################
# load libraries
################
require(mvtnorm)
require(Matrix)
set.seed(123)

#########################
# specify data generation
#########################
nus <- list(c(0.5, 0.3), c(1, 0.4), c(2)) # eigenvalues
sigmasq <- 2.5e-05 # error variance
NPCs <- c(rep(2, 2), 1) # number of eigenfunctions
Lvec <- c(rep(2, 2), 480) # number of levels
H <- 3 # number of functional random effects (in total)
G <- 2 # number of functional random effects not used for the estimation of the error variance
gridpoints <- seq(from = 0, to = 1, length = 100) # grid points
class_nr <- 2 # number of groups

# define eigenfunctions
#######################
funB1<-function(k,t){
  if(k == 1)
    out <- sqrt(2) * sin(2 * pi * t)
  if(k == 2)
    out <- sqrt(2) * cos(2 * pi * t)
  out
}

funB2<-function(k,t){
  if(k == 1)
    out <- sqrt(7) * (20 * t^3 - 30 * t^2 + 12 * t - 1)
  if(k == 2)
    out <- sqrt(3) * (2 * t - 1)
  out
}

funE<-function(k,t){
  if(k == 1)
    out <- 1 + t - t
  if(k == 2)
    out <- sqrt(5) * (6 * t^2 - 6 * t + 1)
  out
}

###############
# generate data
###############
D <- length(gridpoints) # number of grid points
n <- Lvec[3] # number of curves in total

class <- rep(1:class_nr, each = n / class_nr)
group1 <- rep(rep(1:Lvec[1], each = n / (Lvec[1] * class_nr)), class_nr)
group2 <- 1:n

data <- data.frame(class = class, group1 = group1, group2 = group2)

# get eigenfunction evaluations
###############################
phis <- list(sapply(1:NPCs[1], FUN = funB1, t = gridpoints),
             sapply(1:NPCs[2], FUN = funB2, t = gridpoints),
             sapply(1:NPCs[3], FUN = funE, t = gridpoints))

# draw basis weights
####################
xis <- vector("list", H)
for(i in 1:H){
if(NPCs[i] > 0){
 xis[[i]] <- rmvnorm(Lvec[i], mean = rep(0, NPCs[i]), sigma = diag(NPCs[i]) * nus[[i]])
 }
}

# construct functional random effects
#####################################
B1 <- xis[[1]] %*% t(phis[[1]])
B2 <- xis[[2]] %*% t(phis[[2]])
E <- xis[[3]] %*% t(phis[[3]])

B1_mat <- B2_mat <- E_mat <- matrix(0, nrow = n, ncol = D)
B1_mat[group1 == 1 & class == 1, ] <- t(replicate(n =  n / (Lvec[1] * class_nr),
B1[1, ], simplify = "matrix"))
B1_mat[group1 == 2 & class == 1, ] <- t(replicate(n =  n / (Lvec[1] * class_nr),
B1[2, ], simplify = "matrix"))
B2_mat[group1 == 1 & class == 2, ] <- t(replicate(n =  n / (Lvec[1] * class_nr),
B2[1, ], simplify = "matrix"))
B2_mat[group1 == 2 & class == 2, ] <- t(replicate(n =  n / (Lvec[1] * class_nr),
B2[2, ], simplify = "matrix"))
E_mat <- E

# draw white noise measurement error
####################################
eps <- matrix(rnorm(n * D, mean = 0, sd = sqrt(sigmasq)), nrow = n, ncol = D)

# construct curves
##################
Y <- B1_mat + B2_mat + E_mat + eps

#################
# construct Zlist
#################
Zlist <- list()
Zlist[[1]] <- Zlist[[2]] <- Zlist[[3]] <- list()

d1 <- data.frame(a = as.factor(data$group1[data$class == 1]))
Zlist[[1]][[1]] <- rbind(sparse.model.matrix(~ -1 + a, d1),
  matrix(0, nrow = (1 / class_nr * n), ncol = (Lvec[1])))

d2 <- data.frame(a = as.factor(data$group1[data$class == 2]))
Zlist[[2]][[1]] <- rbind(matrix(0, nrow = (1 / class_nr * n),
  ncol = (Lvec[2])), sparse.model.matrix(~ -1 + a, d2))

d3 <- data.frame(a = as.factor(data$group2))
Zlist[[3]][[1]] <- sparse.model.matrix(~ -1 + a, d3)

################
# run estimation
################
results <- denseFLMM(Y = Y, gridpoints = gridpoints, Zlist = Zlist, G = G, Lvec = Lvec,
                  groups = NA, Zvars = NA, L = 0.99999, NPC = NA,
                  smooth = FALSE)

###############################
# plot estimated eigenfunctions
###############################
with(results, matplot(gridpoints, phi[[1]], type = "l"))
with(results, matplot(gridpoints, phi[[2]], type = "l"))
with(results, matplot(gridpoints, phi[[3]], type = "l"))




