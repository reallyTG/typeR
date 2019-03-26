library(moko)


### Name: MEGO
### Title: MEGO: Multi-Objective Efficient Global Optimization Algorithm
###   based on scalarization of the objectives
### Aliases: MEGO

### ** Examples

# ----------------
# The Nowacki Beam
# ----------------
n <- 20
d <- 2
nsteps <- 1 # value has been set to 1 to save compliation time, change this value to 40.
fun <- nowacki_beam
doe <- replicate(d,sample(0:n,n))/n
res <- t(apply(doe, 1, fun))
model <- mkm(doe, res, modelcontrol = list(objective = 1:2, lower = rep(0.1,d)))
model <- MEGO(model, fun, nsteps, quiet = FALSE, control = list(rho = 0.1))
plot(nowacki_beam_tps$set)
points(ps(model@response[which(model@feasible),model@objective])$set, col = 'green', pch = 19)

############################################
#### some single objective optimization ####
############################################
## Not run: 
##D ## Those examples are flagged as "don't run" only to save compilation time. ##
##D n.grid <- 20
##D x.grid <- y.grid <- seq(0,1,length=n.grid)
##D design.grid <- expand.grid(x.grid, y.grid)
##D response.grid <- apply(design.grid, 1, DiceKriging::branin)
##D z.grid <- matrix(response.grid, n.grid, n.grid)
##D 
##D # -----------------------------------
##D # Branin-Hoo function (unconstrained)
##D # -----------------------------------
##D n <- 10
##D d <- 2
##D doe <- replicate(d,sample(0:n,n))/n
##D fun <- DiceKriging::branin
##D res <- apply(doe, 1, fun)
##D model <- mkm(doe, res, modelcontrol = list(lower=rep(0.1,d)))
##D model <- MEGO(model, fun, 10, quiet = FALSE)
##D contour(x.grid,y.grid,z.grid,40)
##D points(model@design, col=ifelse(model@feasible,'blue','red'))
##D # ---------------------------------------
##D # Branin-Hoo function (simple constraint)
##D # ---------------------------------------
##D n <- 10
##D d <- 2
##D doe <- replicate(d,sample(0:n,n))/n
##D fun_cost <- DiceKriging::branin
##D fun_cntr <- function(x) 0.2 - prod(x)
##D fun <- function(x) return(c(fun_cost(x),fun_cntr(x)))
##D res <- t(apply(doe, 1, fun))
##D model <- mkm(doe, res, modelcontrol = list(objective = 1, lower=rep(0.1,d)))
##D model <- MEGO(model, fun, 10, quiet = FALSE)
##D contour(x.grid,y.grid,z.grid,40)
##D points(model@design, col=ifelse(model@feasible,'blue','red'))
##D # ---------------------------------------
##D # Branin-Hoo function (narrow constraint)
##D # ---------------------------------------
##D n <- 10
##D d <- 2
##D doe <- replicate(d,sample(0:n,n))/n
##D fun_cost <- DiceKriging::branin
##D fun_cntr <- function(x){
##D  g1 <- 0.9 - sum(x)
##D  g2 <- sum(x) - 1.1
##D  g3 <- - x[1] + 0.75
##D  g4 <- x[2] - 0.25
##D  return(c(g1,g2,g3,g4))
##D }
##D fun <- function(x) return(c(fun_cost(x),fun_cntr(x)))
##D res <- t(apply(doe, 1, fun))
##D model <- mkm(doe, res, modelcontrol = list(objective = 1, lower=rep(0.1,d)))
##D model <- MEGO(model, fun, 10, quiet = FALSE)
##D contour(x.grid,y.grid,z.grid,40)
##D points(model@design, col=ifelse(model@feasible,'blue','red'))
##D # ---------------------------------------------
##D # Branin-Hoo function (disconnected constraint)
##D # ---------------------------------------------
##D n <- 10
##D d <- 2
##D doe <- replicate(d,sample(0:n,n))/n
##D Griewank <-  function(x) {
##D  ii <- c(1:length(x))
##D   sum <- sum(x^2/4000)
##D   prod <- prod(cos(x/sqrt(ii)))
##D   y <- sum - prod + 1
##D   return(y)
##D }
##D fun_cost <- DiceKriging::branin
##D fun_cntr <- function(x) 1.6 - Griewank(x*10-5)
##D fun <- function(x) return(c(fun_cost(x),fun_cntr(x)))
##D res <- t(apply(doe, 1, fun))
##D model <- mkm(doe, res, modelcontrol = list(objective = 1, lower=c(0.1,0.1)))
##D model <- MEGO(model, fun, 10, quiet = FALSE)
##D contour(x.grid,y.grid,z.grid,40)
##D points(model@design, col=ifelse(model@feasible,'blue','red'))
## End(Not run)



