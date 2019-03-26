library(coin)


### Name: photocar
### Title: Multiple Dosing Photococarcinogenicity Experiment
### Aliases: photocar
### Keywords: datasets

### ** Examples

## Plotting data
op <- par(no.readonly = TRUE) # save current settings
layout(matrix(1:3, ncol = 3))
with(photocar, {
    plot(survfit(Surv(time, event) ~ group),
         lty =  1:3, xmax = 50, main = "Survival Time")
    legend("bottomleft", lty = 1:3, levels(group), bty = "n")
    plot(survfit(Surv(dmin, tumor) ~ group),
         lty = 1:3, xmax = 50, main = "Time to First Tumor")
    legend("bottomleft", lty = 1:3, levels(group), bty = "n")
    boxplot(ntumor ~ group, main = "Number of Tumors")
})
par(op) # reset

## Approximative multivariate (all three responses) test
it <- independence_test(Surv(time, event) + Surv(dmin, tumor) + ntumor ~ group,
                        data = photocar,
                        distribution = approximate(B = 10000))

## Global p-value
pvalue(it)

## Why was the global null hypothesis rejected?
statistic(it, type = "standardized")
pvalue(it, method = "single-step")



