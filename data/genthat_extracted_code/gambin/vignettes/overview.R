## ------------------------------------------------------------------------
library("gambin")
data(moths, package="gambin")

##unimodal model
fit = fit_abundances(moths)
fit$alpha
barplot(fit)
points(fit)
AIC(fit)

##unimodal model (fit to a subsample of 1000 individuals)
fit2 = fit_abundances(moths, subsample = 1000)
fit2$alpha
barplot(fit2)
points(fit2)
AIC(fit2)

##bimodal model (using 3 cores)

#simulate bimodal gambin distribution
x1 = rgambin(600, 5, 10)
x2 = rgambin(300, 1, 10)
x = table(c(x1,x2))
freq = as.vector(x)
values = as.numeric(as.character(names(x)))
abundances = data.frame(octave=values, species = freq)

#fit bimodal model to simulated data
fit3 = fit_abundances(abundances, no_of_components = 2, cores = 1)
barplot(fit3)
points(fit3)
AIC(fit3)
#compare with AIC of unimodal model
AIC(fit_abundances(abundances))

#fit a bimodal model to a species classification dataset
#and calculate the number of the differet categories in each octave
data(categ, package="gambin")
fits2 = fit_abundances(categ$abundances, no_of_components = 2)
#without species classification data
d1 <- deconstruct_modes(fits2, dat = categ, peak_val = NULL, abundances = "abundances", 
     species = "species", categ = "status", col.statu = c("green", "red", "blue"))

