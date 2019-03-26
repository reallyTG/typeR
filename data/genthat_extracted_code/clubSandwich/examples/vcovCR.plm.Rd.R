library(clubSandwich)


### Name: vcovCR.plm
### Title: Cluster-robust variance-covariance matrix for a plm object.
### Aliases: vcovCR.plm

### ** Examples


library(plm)
# fixed effects
data("Produc", package = "plm")
plm_FE <- plm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, 
              data = Produc, index = c("state","year"), 
              effect = "individual", model = "within")  
vcovCR(plm_FE, type="CR2")

# random effects
plm_RE <- update(plm_FE, model = "random")
vcovCR(plm_RE, type = "CR2")

# first differencing
data(Fatalities, package = "AER")
Fatalities <- within(Fatalities, {
  frate <- 10000 * fatal / pop
  drinkagec <- cut(drinkage, breaks = 18:22, include.lowest = TRUE, right = FALSE)
  drinkagec <- relevel(drinkagec, ref = 4)
})

plm_FD <- plm(frate ~ beertax + drinkagec + miles + unemp + log(income), 
              data = Fatalities, index = c("state", "year"), 
              model = "fd")
vcovHC(plm_FD, method="arellano", type = "sss", cluster = "group")
vcovCR(plm_FD, type = "CR1S")
vcovCR(plm_FD, type = "CR2")





