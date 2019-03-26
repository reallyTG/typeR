## ------------------------------------------------------------------------
library(mobsim)
sim_dat1 <- sim_thomas_community(s_pool = 30,  n_sim = 1000, sad_type = "lnorm",
                                 sad_coef = list("meanlog" = 2, "sdlog" = 1),
                                 sigma = 0.1, mother_points = 1)

## ---- fig.width = 5, fig.height = 5--------------------------------------
plot(sim_dat1)
summary(sim_dat1)
str(sim_dat1)

## ------------------------------------------------------------------------
abund1 <- community_to_sad(sim_dat1)

## ---- fig.width = 5, fig.height = 5--------------------------------------
plot(abund1, method = "rank")

## ---- fig.width = 5, fig.height = 5--------------------------------------
plot(abund1, method = "octave")

## ---- fig.width = 5, fig.height = 5--------------------------------------
rare1 <- spec_sample_curve(sim_dat1, method = "rarefaction")
str(rare1)
plot(rare1)

## ---- fig.width = 5, fig.height = 5--------------------------------------
spec_curves1 <- spec_sample_curve(sim_dat1, method = c("accumulation", "rarefaction"))
plot(spec_curves1)

## ------------------------------------------------------------------------
subplot_size <- c(0.01, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 
                   0.6, 0.7, 0.8, 0.9, 0.95, 0.99, 1)
divar1 <- divar(sim_dat1, prop_area = subplot_size)
head(divar1)

## ---- fig.width = 5, fig.height = 5--------------------------------------
plot(divar1)

## ----fig.width=5, fig.height=5-------------------------------------------
dd1 <- dist_decay(sim_dat1, prop_area = 0.01, n_samples = 20, method = "bray")
head(dd1)

plot(dd1)

