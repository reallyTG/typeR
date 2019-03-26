library(EpiStats)


### Name: orderFactors
### Title: Generates ordered factors.
### Aliases: orderFactors
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(EpiStats)

# Dataset by Anja Hauri, RKI.
data(Tiramisu)
DF <- Tiramisu

# Table with percentagges and statistic on ordered factors
DF %<>%
  orderFactors(ill , values = c(1,0), labels = c("YES", "NO")) %>%
  orderFactors(sex, values = c("males", "females"), labels = c("Males", "Females"))
crossTable(DF, "ill", "sex", "both", "chi2")



