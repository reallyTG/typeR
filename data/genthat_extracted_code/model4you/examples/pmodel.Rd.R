library(model4you)


### Name: pmodel
### Title: Personalised model
### Aliases: pmodel

### ** Examples

library("model4you")

if(require("mvtnorm") & require("survival")) {
  
  ## function to simulate the data
  sim_data <- function(n = 500, p = 10, beta = 3, sd = 1){
    
    ## treatment
    lev <- c("C", "A")
    a <- rep(factor(lev, labels = lev, levels = lev), length = n)
    
    ## correlated z variables
    sigma <- diag(p) 
    sigma[sigma == 0] <- 0.2
    ztemp <- rmvnorm(n, sigma = sigma)
    z <- (pnorm(ztemp) * 2 * pi) - pi  
    colnames(z) <- paste0("z", 1:ncol(z))
    z1 <- z[,1]
    
    ## outcome
    y <- 7 + 0.2 * (a %in% "A") + beta * cos(z1) * (a %in% "A") + rnorm(n, 0, sd)
    
    data.frame(y = y, a = a, z)
  }
  
  ## simulate data
  set.seed(123)
  beta <- 3
  ntrain <- 500
  ntest <- 50
  simdata <- simdata_s <- sim_data(p = 5, beta = beta, n = ntrain)
  tsimdata <- tsimdata_s <- sim_data(p = 5, beta = beta, n = ntest)
  simdata_s$cens <- rep(1, ntrain)
  tsimdata_s$cens <- rep(1, ntest)
  
  ## base model
  basemodel_lm <- lm(y ~ a, data = simdata)
  
  ## forest
  frst_lm <- pmforest(basemodel_lm, ntree = 20, 
                      perturb = list(replace = FALSE, fraction = 0.632),
                      control = ctree_control(mincriterion = 0))
  
  ## personalised models
  # (1) return the model objects
  pmodels_lm <- pmodel(x = frst_lm, newdata = tsimdata, fun = identity)
  class(pmodels_lm)
  # (2) return coefficients only (default)
  coefs_lm <- pmodel(x = frst_lm, newdata = tsimdata)
  
  # compare predictive objective functions of personalised models versus
  # base model
  sum(objfun(pmodels_lm)) # -RSS personalised models
  sum(objfun(basemodel_lm, newdata = tsimdata)) # -RSS base model
  
  
  if(require("ggplot2")) {
    ## dependence plot
    dp_lm <- cbind(coefs_lm, tsimdata)
    ggplot(tsimdata) +
      stat_function(fun = function(z1) 0.2 + beta * cos(z1), 
                    aes(color = "true treatment\neffect")) +
      geom_point(data = dp_lm, 
                 aes(y = aA, x = z1, color = "estimates lm"), 
                 alpha = 0.5)  +
      ylab("treatment effect") + 
      xlab("patient characteristic z1")
  }
}




