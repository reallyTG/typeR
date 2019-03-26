library(clubSandwich)


### Name: vcovCR.gls
### Title: Cluster-robust variance-covariance matrix for a gls object.
### Aliases: vcovCR.gls

### ** Examples


library(nlme)
data(Ovary, package = "nlme")
Ovary$time_int <- 1:nrow(Ovary)
lm_AR1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), data = Ovary, 
              correlation = corAR1(form = ~ time_int | Mare))
vcovCR(lm_AR1, type = "CR2")
    



