library(modi)


### Name: EAimp
### Title: Epidemic Algorithm for imputation of multivariate outliers in
###   incomplete survey data.
### Aliases: EAimp

### ** Examples

data(bushfirem, bushfire.weights)
det.res <- EAdet(bushfirem, bushfire.weights)
imp.res <- EAimp(bushfirem, bushfire.weights, outind = det.res$outind,
reach = det.res$output$max.min.di, kdon = 3)
print(imp.res$output)



