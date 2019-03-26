library(spatstat)


### Name: rppm
### Title: Recursively Partitioned Point Process Model
### Aliases: rppm
### Keywords: spatial models

### ** Examples

    # New Zealand trees data: trees planted along border
    # Use covariates 'x', 'y'
    nzfit <- rppm(nztrees ~ x + y)
    nzfit
    prune(nzfit, cp=0.035)
    # Murchison gold data: numeric and logical covariates
    mur <- solapply(murchison, rescale, s=1000, unitname="km")
    mur$dfault <- distfun(mur$faults)
    # 
    mfit <- rppm(gold ~ dfault + greenstone, data=mur)
    mfit
    # Gorillas data: factor covariates
    #          (symbol '.' indicates 'all variables')
    gfit <- rppm(unmark(gorillas) ~ . , data=gorillas.extra)
    gfit



