library(npsurv)


### Name: cancer
### Title: Breast Retraction Times after Beast Cancer Treatments.
### Aliases: cancer
### Keywords: datasets

### ** Examples

data(cancer)
i = cancer$group == "RT"
plot(npsurv(cancer[i,1:2]), xlim=c(0,60))
plot(npsurv(cancer[!i,1:2]), add=TRUE, col="green3")



