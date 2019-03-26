library(smacpod)


### Name: spscan.test
### Title: Spatial Scan Test
### Aliases: spscan.test

### ** Examples

data(grave)
out = spscan.test(grave, nsim = 99)
plot(out, chars = c(1, 20), main = "most likely cluster")
# get warning if no significant cluster
out2 = spscan.test(grave, alpha = 0.001, nsim = 99)



