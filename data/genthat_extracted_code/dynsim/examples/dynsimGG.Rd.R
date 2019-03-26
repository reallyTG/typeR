library(dynsim)


### Name: dynsimGG
### Title: Plot dynamic simulation results from 'dynsim'
### Aliases: dynsimGG

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

# Set up scenarios for company 4
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

# Combine into a single list
ScenComb <- list(Scen1, Scen2, Scen3)

## Run dynamic simulations without shocks
Sim1 <- dynsim(obj = M1, ldv = "InvestLag", scen = ScenComb, n = 20)

# Create plot legend label
Labels <- c("5th Percentile", "Mean", "95th Percentile")

# Plot
dynsimGG(Sim1, leg.labels = Labels)

## Run dynamic simulations with shocks

# Create data frame of shock values
mShocks <- data.frame(times = c(5, 10), kstock = c(100, 1000))

# Run simulations
Sim2 <- dynsim(obj = M1, ldv = "InvestLag", scen = ScenComb, n = 20,
               shocks = mShocks)

# Plot
dynsimGG(Sim2, leg.labels = Labels)

# Plot with accompanying shock plot
dynsimGG(Sim2, leg.labels = Labels, shockplot.var = "kstock")




