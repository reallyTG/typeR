library(coneproj)


### Name: shapereg
### Title: Shape-Restricted Regression
### Aliases: shapereg
### Keywords: cone projection routines

### ** Examples

# load the feet data set
    data(feet)

# extract the continuous and constrained predictor
    l <- feet$length

# extract the continuous response
    w <- feet$width

# extract the categorical covariate: sex
    s <- feet$sex

# make an increasing fit with test set as FALSE
    ans <- shapereg(w ~ incr(l) + factor(s))

# check the summary table 
    summary(ans)

# make an increasing fit with test set as TRUE
    ans <- shapereg(w ~ incr(l) + factor(s), test = TRUE, nloop = 1e+3)

# check the summary table 
    summary(ans)

# make a plot comparing the unconstrained fit and the constrained fit
    par(mar = c(4, 4, 1, 1))
    ord <- order(l)
    plot(sort(l), w[ord], type = "n", xlab = "foot length (cm)", ylab = "foot width (cm)")
    title("Shapereg Example Plot")

# sort l according to sex
    ord1 <- order(l[s == "G"])
    ord2 <- order(l[s == "B"])

# make the scatterplot of l vs w for boys and girls
    points(sort(l[s == "G"]), w[s == "G"][ord1], pch = 21, col = 1)
    points(sort(l[s == "B"]), w[s == "B"][ord2], pch = 24, col = 2)

# make an unconstrained fit to boys and girls
    fit <- lm(w ~ l + factor(s))

# plot the unconstrained fit 
    lines(sort(l), (coef(fit)[1] + coef(fit)[2] * l + coef(fit)[3])[ord], lty = 2)
    lines(sort(l), (coef(fit)[1] + coef(fit)[2] * l)[ord], lty = 2, col = 2)
    legend(21.5, 9.8, c("boy","girl"), pch = c(24, 21), col = c(2, 1)) 

# plot the constrained fit
    lines(sort(l), (ans$constr.fit - ans$linear.fit + coef(ans)[1])[ord], col = 1)
    lines(sort(l), (ans$constr.fit - ans$linear.fit + coef(ans)[1] + coef(ans)[2])[ord], col = 2)



