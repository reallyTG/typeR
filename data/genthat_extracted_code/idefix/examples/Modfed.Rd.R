library(idefix)


### Name: Modfed
### Title: Modified Federov algorithm for MNL models.
### Aliases: Modfed

### ** Examples

## No test: 
# DB-efficient designs
# 3 Attributes, all dummy coded. 1 alternative specific constant. = 7 parameters
cand.set <- Profiles(lvls = c(3, 3, 3), coding = c("D", "D", "D"))
mu <- c(0.5, 0.8, 0.2, -0.3, -1.2, 1.6, 2.2) # Prior parameter vector
v <- diag(length(mu)) # Prior variance.
set.seed(123) 
pd <- MASS::mvrnorm(n = 10, mu = mu, Sigma = v) # 10 draws.
p.d <- list(matrix(pd[,1], ncol = 1), pd[,2:7])
Modfed(cand.set = cand.set, n.sets = 8, n.alts = 2, 
       alt.cte = c(1, 0), parallel = FALSE, par.draws = p.d, best = FALSE)

# DB-efficient design with start design provided.  
# 3 Attributes with 3 levels, all dummy coded (= 6 parameters).
cand.set <- Profiles(lvls = c(3, 3, 3), coding = c("D", "D", "D")) 
mu <- c(0.8, 0.2, -0.3, -0.2, 0.7, 0.4) # Prior mean (total = 5 parameters).
v <- diag(length(mu)) # Prior variance.
sd <- list(example_design)
set.seed(123)
ps <- MASS::mvrnorm(n = 10, mu = mu, Sigma = v) # 10 draws.
Modfed(cand.set = cand.set, n.sets = 8, n.alts = 2, 
       alt.cte = c(0, 0), parallel = FALSE, par.draws = ps, start.des = sd)
## End(No test)



