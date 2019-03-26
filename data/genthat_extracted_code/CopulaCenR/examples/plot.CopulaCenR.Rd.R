library(CopulaCenR)


### Name: plot.CopulaCenR
### Title: Plotting for CopulaCenR fits
### Aliases: plot.CopulaCenR

### ** Examples

data(AREDS)
# fit a Copula2-Sieve model
copula2_sp <- ic_spTran_copula(data = AREDS, copula = "Copula2",
              l = 0, u = 15, m = 3, r = 3,
              var_list = c("ENROLLAGE","rs2284665","SevScaleBL"))
newdata = data.frame(id = rep(1, each=2), ind = rep(c(1,2),1),
                     SevScaleBL = rep(3,2), ENROLLAGE = rep(60,2),
                     rs2284665 = c(0,0))
# Plot joint survival probabilities
plot(x = copula2_sp, class = "joint", newdata = newdata)

# Plot conditional survival probabilities
plot(x = copula2_sp, class = "conditional", newdata = newdata,
     cond_margin = 2, cond_time = 5, ylim = c(0.25,1),
     ylab = "Conditional Survival Probability")

# Plot marginal survival probabilities
plot(x = copula2_sp, class = "marginal", newdata = newdata,
     plot_margin = 1, ylim = c(0.6,1),
     ylab = "Marginal Survival Probability")



