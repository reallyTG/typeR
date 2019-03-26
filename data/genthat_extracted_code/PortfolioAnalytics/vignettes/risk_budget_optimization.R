### R code from vignette source 'risk_budget_optimization.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: risk_budget_optimization.Rnw:85-86
###################################################
options(width=80)


###################################################
### code chunk number 2: risk_budget_optimization.Rnw:89-97
###################################################
library(PortfolioAnalytics)
library(DEoptim)
library(robustbase)
data(indexes)
class(indexes)
indexes <- indexes[,1:4]
head(indexes,2)
tail(indexes,2)


###################################################
### code chunk number 3: risk_budget_optimization.Rnw:106-112
###################################################
# Create the portfolio specification object
Wcons <- portfolio.spec( assets = colnames(indexes) )
# Add box constraints
Wcons <- add.constraint( portfolio=Wcons, type='box', min = 0, max=1 )
# Add the full investment constraint that specifies the weights must sum to 1.
Wcons <- add.constraint( portfolio=Wcons, type="full_investment")


###################################################
### code chunk number 4: risk_budget_optimization.Rnw:116-120
###################################################
constrained_objective( w = rep(1/4,4) , R = indexes, portfolio = Wcons) 
constrained_objective( w = rep(1/3,4) , R = indexes, portfolio = Wcons) 
constrained_objective( w = rep(1/3,4) , R = indexes, portfolio = Wcons, 
                       normalize=FALSE) 


###################################################
### code chunk number 5: risk_budget_optimization.Rnw:129-131
###################################################
ObjSpec = add.objective( portfolio = Wcons , type="risk",name="CVaR",
                         arguments=list(p=0.95), enabled=TRUE)   


###################################################
### code chunk number 6: risk_budget_optimization.Rnw:135-136
###################################################
constrained_objective( w = rep(1/4,4) , R = indexes, portfolio = ObjSpec) 


###################################################
### code chunk number 7: risk_budget_optimization.Rnw:140-144
###################################################
library(PerformanceAnalytics)
out<-ES(indexes, weights = rep(1/4,4),p=0.95, 
        portfolio_method="component")
out$MES


###################################################
### code chunk number 8: risk_budget_optimization.Rnw:148-151
###################################################
out<-ES(indexes, weights = rep(1/4,4),p=0.95, clean="boudt", 
        portfolio_method="component")
out$MES


###################################################
### code chunk number 9: risk_budget_optimization.Rnw:155-158
###################################################
ObjSpec = add.objective( portfolio = Wcons , type="risk",name="CVaR",
                         arguments=list(p=0.95,clean="boudt"), enabled=TRUE)   
constrained_objective( w = rep(1/4,4) , R = indexes[,1:4] , portfolio = ObjSpec)


###################################################
### code chunk number 10: risk_budget_optimization.Rnw:164-168
###################################################
ObjSpec = add.objective( portfolio = Wcons , type="risk",name="CVaR",
                         arguments=list(p=0.95,clean="boudt"), 
                         enabled=TRUE, garch=TRUE)   
constrained_objective( w = rep(1/4,4) , R = indexes[,1:4] , portfolio = ObjSpec)


###################################################
### code chunk number 11: risk_budget_optimization.Rnw:174-177
###################################################
ObjSpec = add.objective( portfolio = Wcons , type="risk_budget_objective",
                         name="CVaR", arguments=list(p=0.95, clean="boudt"), 
                         min_concentration=TRUE, enabled=TRUE)   


###################################################
### code chunk number 12: risk_budget_optimization.Rnw:181-183
###################################################
constrained_objective( w = rep(1/4,4) , R = indexes, 
                       portfolio = ObjSpec, trace=TRUE)


###################################################
### code chunk number 13: risk_budget_optimization.Rnw:187-189
###################################################
ES(indexes[,1:4],weights = rep(1/4,4),p=0.95,clean="boudt", 
   portfolio_method="component")


###################################################
### code chunk number 14: risk_budget_optimization.Rnw:196-200
###################################################
ObjSpec = add.objective( portfolio = Wcons , type="risk_budget_objective", 
                         name="CVaR", max_prisk = 0.3, 
                         arguments=list(p=0.95,clean="boudt"), enabled=TRUE) 
constrained_objective( w = rep(1/4,4) , R = indexes, portfolio = ObjSpec) 


###################################################
### code chunk number 15: risk_budget_optimization.Rnw:218-232
###################################################
# Create the portfolio specification object
ObjSpec <- portfolio.spec(assets=colnames(indexes[,1:4]))
# Add box constraints
ObjSpec <- add.constraint(portfolio=ObjSpec, type='box', min = 0, max=1)
# Add the full investment constraint that specifies the weights must sum to 1.
ObjSpec <- add.constraint(portfolio=ObjSpec, type="weight_sum", 
                          min_sum=0.99, max_sum=1.01)
# Add objective to minimize CVaR
ObjSpec <- add.objective(portfolio=ObjSpec, type="risk", name="CVaR", 
                         arguments=list(p=0.95, clean="boudt"))
# Add objective for an upper 40% CVaR allocation
ObjSpec <- add.objective(portfolio=ObjSpec, type="risk_budget_objective",
                         name="CVaR", max_prisk=0.4, 
                         arguments=list(p=0.95, clean="boudt"))


###################################################
### code chunk number 16: risk_budget_optimization.Rnw:237-242
###################################################
set.seed(1234)
out <- optimize.portfolio(R=indexes, portfolio=ObjSpec, 
                          optimize_method="DEoptim", search_size=2000,
                          traceDE=5, itermax=50, trace=TRUE)
print(out)


###################################################
### code chunk number 17: risk_budget_optimization.Rnw:248-256
###################################################
names(out)
# View the DEoptim_objective_results information at the last iteration
out$DEoptim_objective_results[[length(out$DEoptim_objective_results)]]

# Extract stats from the out object into a matrix
xtract <- extractStats(out)
dim(xtract)
head(xtract)


###################################################
### code chunk number 18: risk_budget_optimization.Rnw:261-263
###################################################
plot.new()
chart.Weights(out)


###################################################
### code chunk number 19: risk_budget_optimization.Rnw:266-268
###################################################
plot.new()
chart.RiskBudget(out, risk.type="pct_contrib", col="blue", pch=18)


###################################################
### code chunk number 20: risk_budget_optimization.Rnw:276-292
###################################################
# Create the portfolio specification object
ObjSpec <- portfolio.spec(assets=colnames(indexes))
# Add box constraints
ObjSpec <- add.constraint(portfolio=ObjSpec, type='box', min = 0, max=1)
# Add the full investment constraint that specifies the weights must sum to 1.
ObjSpec <- add.constraint(portfolio=ObjSpec, type="weight_sum", 
                          min_sum=0.99, max_sum=1.01)
# Add objective for min CVaR concentration
ObjSpec <- add.objective(portfolio=ObjSpec, type="risk_budget_objective",
                         name="CVaR", arguments=list(p=0.95, clean="boudt"),
                         min_concentration=TRUE)

set.seed(1234)
out <- optimize.portfolio(R=indexes, portfolio=ObjSpec, 
                          optimize_method="DEoptim", search_size=5000,
                          itermax=50, traceDE=5, trace=TRUE)


###################################################
### code chunk number 21: risk_budget_optimization.Rnw:297-302
###################################################
print(out)

# Verify results with ES function
ES(indexes[,1:4], weights=out$weights, p=0.95, clean="boudt", 
   portfolio_method="component")


###################################################
### code chunk number 22: risk_budget_optimization.Rnw:307-310
###################################################
plot.new()
chart.RiskBudget(out, neighbors=25, risk.type="pct_contrib", 
                 col="blue", pch=18)


###################################################
### code chunk number 23: risk_budget_optimization.Rnw:320-326
###################################################
set.seed(1234)
out <- optimize.portfolio.rebalancing(R=indexes, portfolio=ObjSpec, 
                                      optimize_method="DEoptim", search_size=5000,
                                      rebalance_on="quarters", 
                                      training_period=nrow(indexes)-12,
                                      traceDE=0)


###################################################
### code chunk number 24: risk_budget_optimization.Rnw:332-335
###################################################
names(out)
names(out$opt_rebalancing[[1]])
out


###################################################
### code chunk number 25: risk_budget_optimization.Rnw:339-342
###################################################
opt.summary <- summary(out)
names(opt.summary)
opt.summary


###################################################
### code chunk number 26: risk_budget_optimization.Rnw:347-350
###################################################
extractWeights(out)
plot.new()
chart.Weights(out, colorset=bluemono)


###################################################
### code chunk number 27: risk_budget_optimization.Rnw:355-356
###################################################
head(extractObjectiveMeasures(out))


###################################################
### code chunk number 28: risk_budget_optimization.Rnw:361-363
###################################################
out$opt_rebalancing[[1]]$data_summary
out$opt_rebalancing[[2]]$data_summary


###################################################
### code chunk number 29: risk_budget_optimization.Rnw:367-369
###################################################
plot.new()
chart.RiskBudget(out, match.col="CVaR", risk.type="percentage", col=bluemono)


###################################################
### code chunk number 30: risk_budget_optimization.Rnw:372-374
###################################################
plot.new()
chart.RiskBudget(out, match.col="CVaR", risk.type="absolute", col=bluemono)


