library(gender)


### Name: gender
### Title: Predict gender from first names using historical data
### Aliases: gender

### ** Examples

gender("madison", method = "demo", years = 1985)
gender("madison", method = "demo", years = c(1900, 1985))
# SSA method
## Not run: gender("madison", method = "demo", years = c(1900, 1985))
# IPUMS method
## Not run: gender("madison", method = "ipums", years = 1860)
# NAPP method
## Not run: gender("madison", method = "napp", countries = c("Sweden", "Denmark"))



