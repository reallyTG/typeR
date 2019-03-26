## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.width = 5, fig.height = 5)

## ------------------------------------------------------------------------
library(mobsim)
sim_com1 <- sim_poisson_community(s_pool = 100, n_sim = 20000)

## ---- fig.width=4.4, fig.height=5----------------------------------------
sample1 <- sample_quadrats(sim_com1)

head(sample1$spec_dat[,1:6])
head(sample1$xy_dat)

## ---- fig.width=4.4, fig.height=5----------------------------------------
sample2 <- sample_quadrats(sim_com1, n_quadrats= 2, quadrat_area = 0.1,
                           avoid_overlap = T)

## ---- fig.width=4.4, fig.height=5----------------------------------------
sample3 <- sample_quadrats(sim_com1, n_quadrats= 20, quadrat_area = 0.001,
                           avoid_overlap = T)

## ---- fig.width=4.4, fig.height=5----------------------------------------
sample4 <- sample_quadrats(sim_com1, n_quadrats= 10, quadrat_area = 0.005,
                           method = "transect", x0 = 0, y0 = 0.5, delta_x = 0.1,
                           delta_y = 0)

sample5 <- sample_quadrats(sim_com1, n_quadrats= 10, quadrat_area = 0.005,
                           method = "transect", x0 = 0, y0 = 0, delta_x = 0.1,
                           delta_y = 0.1)

## ---- fig.width=4.4, fig.height=5----------------------------------------
sample6 <- sample_quadrats(sim_com1, n_quadrats= 25, quadrat_area = 0.005,
                           method = "grid", x0 = 0, y0 = 0, delta_x = 0.1,
                           delta_y = 0.1)

sample7 <- sample_quadrats(sim_com1, n_quadrats= 25, quadrat_area = 0.005,
                           method = "grid", x0 = 0.05, y0 = 0.05, delta_x = 0.2,
                           delta_y = 0.2)

## ------------------------------------------------------------------------
sample7a <- sample_quadrats(sim_com1, n_quadrats= 25, quadrat_area = 0.005,
                           method = "grid", x0 = 0.05, y0 = 0.05, delta_x = 0.2,
                           delta_y = 0.2, plot = F)
head(sample7a$spec_dat[,1:10])

