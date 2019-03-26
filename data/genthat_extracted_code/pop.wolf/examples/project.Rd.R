library(pop.wolf)


### Name: project
### Title: Wolf population projections
### Aliases: project C_montecarlo

### ** Examples


# Number of years to project
years <- 15

# Initial population
pop_initial <- list()
# 10 packs of size 5 with alpha male aged 2 and alpha female aged 3
pop_initial$packs <- matrix(rep(c(2,3,5),10), ncol=3, nrow=10, byrow=TRUE)
# 5 vagrants
pop_initial$vagrants <- 5

# Hunting quota
pop_quota <- matrix(0, nrow=12*years+1, ncol=5)
# Hunt 4 alphas every March
pop_quota[1+seq(3,years*12,12),2] <- 4

projection <- project(
	years = years,
	runs = 100,
	surv_pup = c(0.65, 0.1),
	surv_sub = c(0.74, 0.13),
	surv_vag = c(0.42, 0.1),
	surv_adt = c(0.82, 0.03),
	dispers_weib_shape = c(1.419, 0.154),
	dispers_weib_scale = c(4.687, 0.528),
	settl_weib_shape = c(1.353, 0.210),
	settl_weib_scale = c(4.606, 0.772),
	pair1breed = c(0.79, 0.05),
	litter_size = c(5, 0.52),
	pop_initial = pop_initial,
	pop_quota = pop_quota,
	seed = 1
)



