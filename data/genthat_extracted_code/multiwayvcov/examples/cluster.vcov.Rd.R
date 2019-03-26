library(multiwayvcov)


### Name: cluster.vcov
### Title: Multi-way standard error clustering
### Aliases: cluster.vcov
### Keywords: clustering errors multi-way robust standard

### ** Examples

library(lmtest)
data(petersen)
m1 <- lm(y ~ x, data = petersen)

# Cluster by firm
vcov_firm <- cluster.vcov(m1, petersen$firmid)
coeftest(m1, vcov_firm)

# Cluster by year
vcov_year <- cluster.vcov(m1, petersen$year)
coeftest(m1, vcov_year)

# Cluster by year using a formula
vcov_year_formula <- cluster.vcov(m1, ~ year)
coeftest(m1, vcov_year_formula)

# Double cluster by firm and year
vcov_both <- cluster.vcov(m1, cbind(petersen$firmid, petersen$year))
coeftest(m1, vcov_both)

# Double cluster by firm and year using a formula
vcov_both_formula <- cluster.vcov(m1, ~ firmid + year)
coeftest(m1, vcov_both_formula)

# Replicate Mahmood Arai's double cluster by firm and year
vcov_both <- cluster.vcov(m1, cbind(petersen$firmid, petersen$year), use_white = FALSE)
coeftest(m1, vcov_both)

# For comparison, produce White HC0 VCOV the hard way
vcov_hc0 <- cluster.vcov(m1, 1:nrow(petersen), df_correction = FALSE)
coeftest(m1, vcov_hc0)

# Produce White HC1 VCOV the hard way
vcov_hc1 <- cluster.vcov(m1, 1:nrow(petersen), df_correction = TRUE)
coeftest(m1, vcov_hc1)

# Produce White HC2 VCOV the hard way
vcov_hc2 <- cluster.vcov(m1, 1:nrow(petersen), df_correction = FALSE, leverage = 2)
coeftest(m1, vcov_hc2)

# Produce White HC3 VCOV the hard way
vcov_hc3 <- cluster.vcov(m1, 1:nrow(petersen), df_correction = FALSE, leverage = 3)
coeftest(m1, vcov_hc3)

# Go multicore using the parallel package
## Not run: 
##D library(parallel)
##D cl <- makeCluster(4)
##D vcov_both <- cluster.vcov(m1, cbind(petersen$firmid, petersen$year), parallel = cl)
##D stopCluster(cl)
##D coeftest(m1, vcov_both)
## End(Not run)



