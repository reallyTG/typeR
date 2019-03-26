library(ReIns)


### Name: trParetoQQ
### Title: Truncated Pareto quantile plot
### Aliases: trParetoQQ

### ** Examples

# Endpoint of truncated Pareto distribution
endpoint <- qpareto(0.99, shape=2)

# Generate sample from truncated Pareto distribution
X <- rtpareto(1000, shape=2, endpoint=endpoint)

# Ordinary Pareto QQ-plot
ParetoQQ(X)

# Truncated Hill estimates
gamma <- trHill(X)$gamma

# Estimates for truncation odds
dt <- trDT(X, gamma=gamma)$DT

# Truncated Pareto QQ-plot
trParetoQQ(X, DT=dt)



