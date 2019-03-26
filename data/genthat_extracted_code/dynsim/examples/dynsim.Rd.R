library(dynsim)


### Name: dynsim
### Title: Dynamic simulations of autoregressive relationships
### Aliases: dynsim

### ** Examples

# Load package
library(DataCombine)

# Load Grunfeld data
data(grunfeld, package = "dynsim")

# Create lag invest variable
grunfeld <- slide(grunfeld, Var = "invest", GroupVar = "company",
               NewVar = "InvestLag")

# Convert company to factor for fixed-effects specification
grunfeld$company <- as.factor(grunfeld$company)

# Estimate basic model
M1 <- lm(invest ~ InvestLag + mvalue + kstock + company, data = grunfeld)

# Estimate model with interaction between mvalue and kstock
M2 <- lm(invest ~ InvestLag + mvalue*kstock + company, data = grunfeld)

# Set up scenarios for company 4
## List version ##
attach(grunfeld)
Scen1 <- data.frame(InvestLag = mean(InvestLag, na.rm = TRUE),
                    mvalue = quantile(mvalue, 0.05),
                    kstock = quantile(kstock, 0.05),
                    company4 = 1)
Scen2 <- data.frame(InvestLag = mean(InvestLag, na.rm = TRUE),
                    mvalue = mean(mvalue),
                    kstock = mean(kstock),
                    company4 = 1)
Scen3 <- data.frame(InvestLag = mean(InvestLag, na.rm = TRUE),
                    mvalue = quantile(mvalue, 0.95),
                    kstock = quantile(kstock, 0.95),
                    company4 = 1)
detach(grunfeld)

## Not run: 
##D ## Alternative data frame version of the scenario builder ##
##D attach(grunfeld)
##D ScenComb <- data.frame(InvestLag = rep(mean(InvestLag, na.rm = TRUE), 3),
##D                       mvalue = c(quantile(mvalue, 0.95), mean(mvalue), 
##D                                  quantile(mvalue, 0.05)),
##D                       kstock = c(quantile(kstock, 0.95), mean(kstock),
##D                                  quantile(kstock, 0.05)),
##D                       company4 = rep(1, 3)
##D )
##D detach(grunfeld)
## End(Not run)

# Combine into a single list
ScenComb <- list(Scen1, Scen2, Scen3)

## Run dynamic simulations without shocks and no interactions
Sim1 <- dynsim(obj = M1, ldv = "InvestLag", scen = ScenComb, n = 20)

## Run dynamic simulations without shocks and interactions
Sim2 <- dynsim(obj = M2, ldv = "InvestLag", scen = ScenComb, n = 20)

## Run dynamic simulations with shocks

# Create data frame of shock values
mShocks <- data.frame(times = c(5, 10), kstock = c(100, 1000),
                      mvalue = c(58, 5000))

# Run simulations without interactions
Sim3 <- dynsim(obj = M1, ldv = "InvestLag", scen = ScenComb, n = 20,
               shocks = mShocks)

# Run simulations with interactions
Sim4 <- dynsim(obj = M2, ldv = "InvestLag", scen = ScenComb, n = 20,
               shocks = mShocks)




