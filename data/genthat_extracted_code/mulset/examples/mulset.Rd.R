library(mulset)


### Name: mulset
### Title: A mulset function
### Aliases: mulset
### Keywords: data intersection, missing mulset, multi-set table

### ** Examples

data(mulsetDemo)
print(head(mulsetDemo))
resamples <- mulset(mulsetDemo, exclude = c("outcome", "age", "gender"), maxIntersections = 250)
## Loop through returned list or convert it to data-frame
## resamplesFrame <- as.data.frame(t(sapply(resamples,c)))



