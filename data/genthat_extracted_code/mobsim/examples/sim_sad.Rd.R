library(mobsim)


### Name: sim_sad
### Title: Simulate species abundance distributions
### Aliases: sim_sad

### ** Examples

#Simulate log-normal species abundance distribution
sad_lnorm1 <- sim_sad(s_pool = 100, n_sim = 10000, sad_type = "lnorm",
                      sad_coef = list("meanlog" = 5, "sdlog" = 0.5))
plot(sad_lnorm1, method = "octave")
plot(sad_lnorm1, method = "rank")

# Alternative parameterization of the log-normal distribution
sad_lnorm2 <- sim_sad(s_pool = 100, n_sim = 10000, sad_type = "lnorm",
                      sad_coef = list("cv_abund" = 0.5))
plot(sad_lnorm2, method = "octave")

# Fix species richness in the simulation by adding rare species
sad_lnorm3a <- sim_sad(s_pool = 500, n_sim = 10000, sad_type = "lnorm",
                       sad_coef = list("cv_abund" = 5), fix_s_sim = TRUE)
sad_lnorm3b <- sim_sad(s_pool = 500, n_sim = 10000, sad_type = "lnorm",
                       sad_coef = list("cv_abund" = 5))

plot(sad_lnorm3a, method = "rank")
points(1:length(sad_lnorm3b), sad_lnorm3b, type = "b", col = 2)
legend("topright", c("fix_s_sim = TRUE","fix_s_sim = FALSE"),
       col = 1:2, pch = 1)

# Different important SAD models

# Fisher's log-series
sad_logseries <- sim_sad(s_pool = NULL, n_sim = 10000, sad_type = "ls",
                         sad_coef = list("N" = 1e5, "alpha" = 20))

# Poisson log-normal
sad_poilog <- sim_sad(s_pool = 100, n_sim = 10000, sad_type = "poilog",
                      sad_coef = list("mu" = 5, "sig" = 0.5))

# Mac-Arthur's broken stick
sad_broken_stick <- sim_sad(s_pool = NULL, n_sim = 10000, sad_type = "bs",
                            sad_coef = list("N" = 1e5, "S" = 100))

# Plot all SADs together as rank-abundance curves
plot(sad_logseries, method = "rank")
lines(1:length(sad_lnorm2), sad_lnorm2, type = "b", col = 2)
lines(1:length(sad_poilog), sad_poilog, type = "b", col = 3)
lines(1:length(sad_broken_stick), sad_broken_stick, type = "b", col = 4)
legend("topright", c("Log-series","Log-normal","Poisson log-normal","Broken stick"),
       col = 1:4, pch = 1)




