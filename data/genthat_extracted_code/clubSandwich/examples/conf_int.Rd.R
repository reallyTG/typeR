library(clubSandwich)


### Name: conf_int
### Title: Calculate confidence intervals for all or selected regression
###   coefficients in a fitted model
### Aliases: conf_int

### ** Examples

data("Produc", package = "plm")
lm_individual <- lm(log(gsp) ~ 0 + state + log(pcap) + log(pc) + log(emp) + unemp, data = Produc)
individual_index <- !grepl("state", names(coef(lm_individual)))
conf_int(lm_individual, vcov = "CR2", cluster = Produc$state, coefs = individual_index)

V_CR2 <- vcovCR(lm_individual, cluster = Produc$state, type = "CR2")
conf_int(lm_individual, vcov = V_CR2, level = .99, coefs = individual_index)




