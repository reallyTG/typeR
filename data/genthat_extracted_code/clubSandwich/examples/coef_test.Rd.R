library(clubSandwich)


### Name: coef_test
### Title: Test all or selected regression coefficients in a fitted model
### Aliases: coef_test

### ** Examples

data("Produc", package = "plm")
lm_individual <- lm(log(gsp) ~ 0 + state + log(pcap) + log(pc) + log(emp) + unemp, data = Produc)
individual_index <- !grepl("state", names(coef(lm_individual)))
coef_test(lm_individual, vcov = "CR2", cluster = Produc$state, coefs = individual_index)

V_CR2 <- vcovCR(lm_individual, cluster = Produc$state, type = "CR2")
coef_test(lm_individual, vcov = V_CR2, coefs = individual_index)




