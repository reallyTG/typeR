library(highriskzone)


### Name: det_hrz_eval_ar
### Title: Determination of high-risk zone on smaller area of interest
###   (evaluation area) than observation area.
### Aliases: det_hrz_eval_ar

### ** Examples

set.seed(12412)
spatstat::spatstat.options(npixel=300)
data(craterB)
# reduce number of observations for faster computation
thin.craterB <- craterB[sample(1:craterB$n, 40)]
# define evaluation area of interest
eval.ar <- spatstat::owin(xrange = c(0, 1900), yrange = c(0, 3400), 
               poly = matrix(c(250,250, 1200,1000,250,1000), byrow = TRUE, ncol = 2))

hrzi1 <- det_hrz_eval_ar(thin.craterB, eval_ar = eval.ar, criterion = "direct",
                        cutoff = 3e-6, nxprob = .2)

plot(hrzi1)
plot(thin.craterB, add = TRUE)
plot(eval.ar, add = TRUE)
plot(craterB$window, add = TRUE)



