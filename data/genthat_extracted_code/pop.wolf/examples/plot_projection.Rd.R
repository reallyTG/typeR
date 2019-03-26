library(pop.wolf)


### Name: plot_projection
### Title: Plot population projections
### Aliases: plot_projection

### ** Examples

projection <- project(
	years = 12,
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
	litter_size = c(5, 0.52)
)

par(mfrow=c(2,2))
plot_projection(projection, "Packs")
plot_projection(projection, "Pairs")
plot_projection(projection, "Reproductions")
plot_projection(projection, "Population")



