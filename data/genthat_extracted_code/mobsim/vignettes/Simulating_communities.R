## ------------------------------------------------------------------------
library(mobsim)

abund1 <- sim_sad(s_pool = 100, n_sim = 1000, sad_type = "lnorm",
                  sad_coef = list("meanlog" = 5, "sdlog" = 0.5))
head(abund1)
summary(abund1)

## ------------------------------------------------------------------------
abund2 <- sim_sad(s_pool = 100, n_sim = 1000, sad_type = "lnorm",
                  sad_coef = list("cv_abund" = 2))
summary(abund2)

## ------------------------------------------------------------------------
abund2a <- sim_sad(s_pool = 100, n_sim = 1000, sad_type = "lnorm",
                  sad_coef = list("cv_abund" = 2), fix_s_sim = T)
summary(abund2a)

## ------------------------------------------------------------------------
abund3 <- sim_sad(s_pool = NULL, n_sim = 10000, sad_type = "ls",
                  sad_coef = list("N" = 1e5, "alpha" = 20))
head(abund3)

## ------------------------------------------------------------------------
length(abund3)
summary(abund3)

## ------------------------------------------------------------------------
abund1 <- c(20,10,10,5,5)
comm1 <- sim_poisson_coords(abund_vec = abund1, xrange = c(0,1), yrange = c(0,1))

## ---- fig.width = 3.5, fig.height = 4------------------------------------
class(comm1)
summary(comm1)
plot(comm1)

## ---- fig.width = 3.5, fig.height = 4------------------------------------
comm2 <- sim_poisson_community(s_pool = 20, n_sim = 200,
                               sad_type = "lnorm",
                               sad_coef = list(cv_abund = 1))
plot(comm2)

## ---- fig.width = 3.5, fig.height = 4------------------------------------
comm3 <- sim_thomas_coords(abund_vec = abund1, sigma = 0.02)
plot(comm3)

## ---- fig.width = 7, fig.height = 4--------------------------------------
comm3a <- sim_thomas_coords(abund_vec = abund1, sigma = 0.05)
par(mfrow = c(1,2))
plot(comm3)
plot(comm3a)

## ---- fig.width = 7, fig.height = 4--------------------------------------
comm3b <- sim_thomas_coords(abund_vec = abund1, sigma = 0.02, mother_points = 1)
par(mfrow = c(1,2))
plot(comm3)
plot(comm3b)

## ---- fig.width = 7, fig.height = 4--------------------------------------
comm3c <- sim_thomas_coords(abund_vec = abund1, sigma = 0.02, cluster_points = 5)
par(mfrow = c(1,2))
plot(comm3)
plot(comm3c)

## ---- fig.width = 3.5, fig.height = 4------------------------------------
comm4 <- sim_thomas_coords(abund_vec = abund1, sigma = 0.02,
                           mother_points = c(5,4,3,2,1))
plot(comm4)

## ---- fig.width = 3.5, fig.height = 4------------------------------------
comm5 <- sim_thomas_community(s_pool = 100, n_sim = 500, sad_type = "lnorm",
                              sad_coef = list(cv_abund = 1),sigma = 0.05)
plot(comm5)

