library(NetworkRiskMeasures)


### Name: contagion
### Title: Contagion Simulations
### Aliases: contagion

### ** Examples

# Loads simulated banking data
data("sim_data")
head(sim_data)

# seed for reproducibility
set.seed(15)

# minimum density estimation
# verbose = F to prevent printing
md_mat <- matrix_estimation(sim_data$assets, sim_data$liabilities, method = "md", verbose = FALSE)

# rownames and colnames for the matrix
rownames(md_mat) <- colnames(md_mat) <- sim_data$bank

# DebtRank simulation
contdr <- contagion(exposures = md_mat, buffer = sim_data$buffer, weights = sim_data$weights, 
                    shock = "all", method = "debtrank", verbose = FALSE)
summary(contdr)

plot(contdr)

# Traditional default cascades simulation
contthr <-  contagion(exposures = md_mat, buffer = sim_data$buffer, weights = sim_data$weights, 
                      shock = "all", method = "threshold", verbose = FALSE)
summary(contthr)

# simulating shock scenarios 1% to 25% shock in all vertices
s <- seq(0.01, 0.25, by = 0.01)
shocks <- lapply(s, function(x) rep(x, nrow(md_mat)))
names(shocks) <- paste(s*100, "pct shock")

cont <- contagion(exposures = md_mat, buffer = sim_data$buffer, shock = shocks, 
                 weights = sim_data$weights, method = "debtrank", verbose = FALSE)
summary(cont)
plot(cont)



