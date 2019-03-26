## ------------------------------------------------------------------------
library(mobsim)

sim_n_high <- sim_thomas_community(s_pool = 200, n_sim = 20000, sad_type = "poilog",
                                   sad_coef = list("cv_abund" = 1), sigma = 0.02)

sim_n_low <- sim_thomas_community(s_pool = 200, n_sim = 10000, sad_type = "poilog",
                                   sad_coef = list("cv_abund" = 1), sigma = 0.02)

## ------------------------------------------------------------------------
summary(sim_n_high)
summary(sim_n_low)

## ---- fig.width=7.2, fig.height=4.1--------------------------------------
par(mfrow = c(1,2))
plot(sim_n_high)
plot(sim_n_low)

## ------------------------------------------------------------------------
area <- c(0.001,0.002,0.005,0.01,0.02,0.05,0.1,0.2,0.5,1.0)
sar_n_high <- divar(sim_n_high, prop_area = area)
sar_n_low <- divar(sim_n_low, prop_area = area)

## ---- fig.width=5, fig.height=5------------------------------------------
names(sar_n_high)

plot(m_species ~ prop_area, data = sar_n_high, type = "b", log = "xy", ylim = c(2,200),
     xlab = "Proportion of area sampled.", ylab = "No. of species",
     main = "Species-area relationship")
lines(m_species ~ prop_area, data = sar_n_low, type = "b", col = "red")
legend("bottomright",c("N high","N low"), col = 1:2, pch = 1)

## ---- fig.width=7.2, fig.height=4.1--------------------------------------
par(mfrow = c(1,2))
samples_S_n_high <- sample_quadrats(sim_n_high, n_quadrats = 100,
                                        quadrat_area = 0.001, method = "random",
                                        avoid_overlap = T)
samples_S_n_low <- sample_quadrats(sim_n_low, n_quadrats = 100,
                                       quadrat_area = 0.001, method = "random",
                                       avoid_overlap = T)

## ---- fig.width=7.2, fig.height=4.1--------------------------------------
par(mfrow = c(1,2))
samples_L_n_high <- sample_quadrats(sim_n_high, n_quadrats = 10,
                                  quadrat_area = 0.01, method = "random",
                                  avoid_overlap = T)
samples_L_n_low <- sample_quadrats(sim_n_low, n_quadrats = 10,
                                  quadrat_area = 0.01, method = "random",
                                  avoid_overlap = T)

## ------------------------------------------------------------------------
dim(samples_L_n_high$spec_dat)
head(samples_L_n_high$spec_dat)[,1:5]

dim(samples_L_n_high$xy_dat)
head(samples_L_n_high$xy_dat)

## ---- message=F----------------------------------------------------------
library(vegan)
S_n_high <- specnumber(samples_S_n_high$spec_dat)
S_n_low <- specnumber(samples_S_n_low$spec_dat)

Shannon_n_high <- diversity(samples_S_n_high$spec_dat, index = "shannon")
Shannon_n_low <- diversity(samples_S_n_low$spec_dat, index = "shannon")

Simpson_n_high <- diversity(samples_S_n_high$spec_dat, index = "simpson")
Simpson_n_low <- diversity(samples_S_n_low$spec_dat, index = "simpson")

## ------------------------------------------------------------------------
div_dat_S <- data.frame(N = rep(c("N high","N low"), each = length(S_n_high)),
                        S = c(S_n_high, S_n_low),
                        Shannon = c(Shannon_n_high, Shannon_n_low),
                        Simpson = c(Simpson_n_high, Simpson_n_low))

## ---- fig.width=7.2, fig.height=3.1--------------------------------------
par(mfrow = c(1,3))
boxplot(S ~ N, data = div_dat_S, ylab = "Species richness")
boxplot(Shannon ~ N, data = div_dat_S, ylab = "Shannon diversity")
boxplot(Simpson ~ N, data = div_dat_S, ylab = "Simpson diversity")

## ------------------------------------------------------------------------
mean_div_S <- aggregate(div_dat_S[,2:4], by = list(div_dat_S$N), FUN = mean)
mean_div_S

## ------------------------------------------------------------------------
relEff_S <- (mean_div_S[mean_div_S$Group.1 == "N low", 2:4] -  mean_div_S[mean_div_S$Group.1 == "N high", 2:4])/
             mean_div_S[mean_div_S$Group.1 == "N high", 2:4]
relEff_S

## ------------------------------------------------------------------------
S_n_high <- specnumber(samples_L_n_high$spec_dat)
S_n_low <- specnumber(samples_L_n_low$spec_dat)

Shannon_n_high <- diversity(samples_L_n_high$spec_dat, index = "shannon")
Shannon_n_low  <- diversity(samples_L_n_low$spec_dat, index = "shannon")

Simpson_n_high <- diversity(samples_L_n_high$spec_dat, index = "simpson")
Simpson_n_low  <- diversity(samples_L_n_low$spec_dat, index = "simpson")

## ------------------------------------------------------------------------
div_dat_L <- data.frame(N = rep(c("N high","N low"), each = length(S_n_high)),
                        S = c(S_n_high, S_n_low),
                        Shannon = c(Shannon_n_high, Shannon_n_low),
                        Simpson = c(Simpson_n_high, Simpson_n_low))

## ---- fig.width=7.2, fig.height=3.1--------------------------------------
par(mfrow = c(1,3))
boxplot(S ~ N, data = div_dat_L, ylab = "Species richness")
boxplot(Shannon ~ N, data = div_dat_L, ylab = "Shannon diversity")
boxplot(Simpson ~ N, data = div_dat_L, ylab = "Simpson diversity")

## ------------------------------------------------------------------------
mean_div_L <- aggregate(div_dat_L[,2:4], by = list(div_dat_L$N), FUN = mean)
relEff_L <- (mean_div_L[mean_div_S$Group.1 == "N low", 2:4] -  mean_div_L[mean_div_L$Group.1 == "N high", 2:4])/
             mean_div_L[mean_div_S$Group.1 == "N high", 2:4]

## ------------------------------------------------------------------------
relEff_S
relEff_L

