## ------------------------------------------------------------------------
library(clubSandwich)
data(MortalityRates)

# subset for deaths in motor vehicle accidents, 1970-1983
MV_deaths <- subset(MortalityRates, cause=="Motor Vehicle" & 
                      year <= 1983 & !is.na(beertaxa))

# fit by OLS
lm_unweighted <- lm(mrate ~ 0 + legal + beertaxa + 
                      factor(state) + factor(year), data = MV_deaths)

## ------------------------------------------------------------------------
coef_test(lm_unweighted, vcov = "CR1", 
          cluster = MV_deaths$state, test = "naive-t")[1:2,]

## ------------------------------------------------------------------------
coef_test(lm_unweighted, vcov = "CR2", 
          cluster = MV_deaths$state, test = "Satterthwaite")[1:2,]

## ---- message = FALSE----------------------------------------------------
library(plm)
plm_unweighted <- plm(mrate ~ legal + beertaxa, data = MV_deaths, 
                      effect = "twoways", index = c("state","year"))
coef_test(plm_unweighted, vcov = "CR1", cluster = "individual", test = "naive-t")
coef_test(plm_unweighted, vcov = "CR2", cluster = "individual", test = "Satterthwaite")

## ------------------------------------------------------------------------
lm_weighted <- lm(mrate ~ 0 + legal + beertaxa + factor(state) + factor(year), 
                  weights = pop, data = MV_deaths)
coef_test(lm_weighted, vcov = "CR1", 
          cluster = MV_deaths$state, test = "naive-t")[1:2,]
coef_test(lm_weighted, vcov = "CR2", 
          cluster = MV_deaths$state, test = "Satterthwaite")[1:2,]

## ------------------------------------------------------------------------
coef_test(lm_weighted, vcov = "CR2", 
          cluster = MV_deaths$state, target = 1 / MV_deaths$pop, 
          test = "Satterthwaite")[1:2,]

## ------------------------------------------------------------------------
plm_random <- plm(mrate ~ 0 + legal + beertaxa + year, data = MV_deaths, 
                  effect = "individual", index = c("state","year"),
                  model = "random")
coef_test(plm_random, vcov = "CR1", test = "naive-t")[1:2,]
coef_test(plm_random, vcov = "CR2", test = "Satterthwaite")[1:2,]

## ------------------------------------------------------------------------
MV_deaths <- within(MV_deaths, {
  legal_cent <- legal - tapply(legal, state, mean)[factor(state)]
  beer_cent <- beertaxa - tapply(beertaxa, state, mean)[factor(state)]
})

plm_Hausman <- plm(mrate ~ 0 + legal + beertaxa + legal_cent + beer_cent + factor(year), 
                   data = MV_deaths,
                   effect = "individual", index = c("state","year"),
                   model = "random")
coef_test(plm_Hausman, vcov = "CR2", test = "Satterthwaite")[1:4,]

## ------------------------------------------------------------------------
Wald_test(plm_Hausman, constraints = c("legal_cent","beer_cent"), 
          vcov = "CR1", test = "chi-sq")

## ------------------------------------------------------------------------
Wald_test(plm_Hausman, constraints = c("legal_cent","beer_cent"), vcov = "CR2")

