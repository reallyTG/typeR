library(nearfar)


### Name: eff_ratio
### Title: Inference for effect ratio
### Aliases: eff_ratio

### ** Examples

k2 = matches(dta=mtcars, covs=c("cyl", "disp"), sinks=0.2, iv="carb",
    cutpoint=2, imp.var=c("cyl"), tol.var=0.03)

eff_ratio(dta=mtcars, match=k2, outc="wt", trt="gear", alpha=0.05)



