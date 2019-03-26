library(AER)


### Name: PSID7682
### Title: PSID Earnings Panel Data (1976-1982)
### Aliases: PSID7682
### Keywords: datasets

### ** Examples

data("PSID7682")

library("plm")
psid <- pdata.frame(PSID7682, c("id", "year"))

## Baltagi & Khanti-Akom, Table I, column "HT"
## original Cornwell & Rupert choice of exogenous variables
psid_ht1 <- plm(log(wage) ~ weeks + south + smsa + married +
  experience + I(experience^2) + occupation + industry + union + gender + ethnicity + education |
  weeks + south + smsa + married + gender + ethnicity,
  data = psid, model = "ht")

## Baltagi & Khanti-Akom, Table II, column "HT"
## alternative choice of exogenous variables
psid_ht2 <- plm(log(wage) ~ occupation + south + smsa + industry +
  experience + I(experience^2) + weeks + married + union + gender + ethnicity + education |
  occupation + south + smsa + industry + gender + ethnicity,
  data = psid, model = "ht")

## Baltagi & Khanti-Akom, Table III, column "HT"
## original choice of exogenous variables + time dummies
## (see also Baltagi, 2001, Table 7.1)
psid$time <- psid$year
psid_ht3 <- plm(log(wage) ~ weeks + south + smsa + married + experience + I(experience^2) +
  occupation + industry + union + gender + ethnicity + education + time |
  weeks + south + smsa + married + gender + ethnicity + time,
  data = psid, model = "ht")



