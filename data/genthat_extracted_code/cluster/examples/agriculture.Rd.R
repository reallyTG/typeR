library(cluster)


### Name: agriculture
### Title: European Union Agricultural Workforces
### Aliases: agriculture
### Keywords: datasets

### ** Examples

data(agriculture)

## Compute the dissimilarities using Euclidean metric and without
## standardization
daisy(agriculture, metric = "euclidean", stand = FALSE)

## 2nd plot is similar to Figure 3 in Struyf et al (1996)
plot(pam(agriculture, 2))

## Plot similar to Figure 7 in Struyf et al (1996)
## Not run: plot(agnes(agriculture), ask = TRUE)
## Don't show: 
plot(agnes(agriculture))
## End(Don't show)

## Plot similar to Figure 8 in Struyf et al (1996)
## Not run: plot(diana(agriculture), ask = TRUE)
## Don't show: 
plot(diana(agriculture))
## End(Don't show)



