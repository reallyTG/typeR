library(lfstat)


### Name: find_droughts
### Title: Identifying Low Flow Periods
### Aliases: find_droughts
### Keywords: low-flow

### ** Examples

data(ray)
ray <- as.xts(ray)["1970::1979", ]
r <- find_droughts(ray)
head(r)
summary(r)

## No test: 
plot(r)
## End(No test)

# threshold is to low, because there are many days with
# zero flow observations
# provide threshold as a constant value
r <- find_droughts(ray, threshold = 0.02)
head(r)
summary(r)
## No test: 
plot(r)
## End(No test)


# provide threshold as a function
r <- find_droughts(ray,
                   threshold = function(x) quantile(x, 0.2, na.rm = TRUE))
head(r)
summary(r)



