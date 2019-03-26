library(PortfolioAnalytics)


### Name: add.objective
### Title: General interface for adding optimization objectives, including
###   risk, return, and risk budget
### Aliases: add.objective add.objective_v1 add.objective add.objective_v2
###   add.objective_v1

### ** Examples

data(edhec)
returns <- edhec[,1:4]
fund.names <- colnames(returns)
portf <- portfolio.spec(assets=fund.names)
# Add some basic constraints
portf <- add.constraint(portf, type="full_investment")
portf <- add.constraint(portf, type="long_only")

# Creates a new portfolio object using portf and adds a quadratic utility
# objective. This will add two objectives to the portfolio object; 1) mean and
# 2) var. The risk aversion parameter is commonly referred to as lambda in the
# quadratic utility formulation that controls how much the portfolio variance 
# is penalized.
portf.maxQU <- add.objective(portf, type="quadratic_utility", 
                             risk_aversion=0.25)

# Creates a new portfolio object using portf and adds mean as an objective
portf.maxMean <- add.objective(portf, type="return", name="mean")

# Creates a new portfolio object using portf and adds StdDev as an objective
portf.minStdDev <- add.objective(portf, type="risk", name="StdDev")

# Creates a new portfolio object using portf and adds ES as an objective. 
# Note that arguments to ES are passed in as a named list.
portf.minES <- add.objective(portf, type="risk", name="ES", 
                             arguments=list(p=0.925, clean="boudt"))

# Creates a new portfolio object using portf.minES and adds a risk budget 
# objective with limits on component risk contribution. 
# Note that arguments to ES are passed in as a named list.
portf.RiskBudgetES <- add.objective(portf.minES, type="risk_budget", name="ES", 
                             arguments=list(p=0.925, clean="boudt"),
                             min_prisk=0, max_prisk=0.6)

# Creates a new portfolio object using portf.minES and adds a risk budget 
# objective with equal component risk contribution. 
# Note that arguments to ES are passed in as a named list.
portf.EqRiskES <- add.objective(portf.minES, type="risk_budget", name="ES", 
                                    arguments=list(p=0.925, clean="boudt"),
                                    min_concentration=TRUE)

# Creates a new portfolio object using portf and adds a weight_concentration 
# objective. The conc_aversion parameter controls how much concentration is
# penalized. The portfolio concentration is defined as the Herfindahl Hirschman
# Index of the weights.
portf.conc <- add.objective(portf, type="weight_concentration", 
                            name="HHI", conc_aversion=0.01)



