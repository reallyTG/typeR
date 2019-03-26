library(highriskzone)


### Name: det_guard_width
### Title: Estimation of width of a guard region given an estimated
###   highriskzone
### Aliases: det_guard_width

### ** Examples

## change npixel to 1000 to obtain nicer plots
spatstat::spatstat.options(npixel=100)
data(craterA)
# reduce number of observations for faster computation
thin.craterA <- craterA[1:50]
hrzi1 <- det_hrz(thin.craterA, type = "intens", criterion = "area", cutoff = 100000, nxprob = 0.1)
det_guard_width(hrzi1, thresh_const = .25)



