library(clubSandwich)


### Name: vcovCR.lm
### Title: Cluster-robust variance-covariance matrix for an lm object.
### Aliases: vcovCR.lm

### ** Examples

data("Produc", package = "plm")
lm_individual <- lm(log(gsp) ~ 0 + state + log(pcap) + log(pc) + log(emp) + unemp, data = Produc)
individual_index <- !grepl("state", names(coef(lm_individual)))
vcovCR(lm_individual, cluster = Produc$state, type = "CR2")[individual_index,individual_index]

# compare to plm()
plm_FE <- plm::plm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp, 
                   data = Produc, index = c("state","year"), 
                   effect = "individual", model = "within")
vcovCR(plm_FE, type="CR2")




