library(lhmixr)


### Name: sim_vb_data
### Title: Simulate sex-specific von Bertalanffy data with missing
###   classifications.
### Aliases: sim_vb_data

### ** Examples

sim.dat <- sim_vb_data(nfemale = 30, nmale = 30, mean_ageF = 3, mean_ageM = 3,
                       growth_parF = c(linf = 30, k = 0.2, t0 = -1, sigma = 0.1),
                       growth_parM = c(linf = 25, k = 0.2, t0 = -1, sigma = 0.1),
                       mat_parF = c(A50 = 3, MR = 1), mat_parM = c(A50 = 2, MR = 1),
                       distribution = "lognormal")

plot(jitter(sim.dat$age), sim.dat$length,
     xlim=c(0, max(sim.dat$age)), ylim = c(0, max(sim.dat$length)),
     col = c("red", "blue", "grey")[match(sim.dat$obs.sex, c("female", "male", "unclassified"))],
     pch = 19, xlab = "age", ylab = "Length")



