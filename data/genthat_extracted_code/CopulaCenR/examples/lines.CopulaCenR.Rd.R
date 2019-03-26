library(CopulaCenR)


### Name: lines.CopulaCenR
### Title: Plotting for CopulaCenR fits
### Aliases: lines.CopulaCenR

### ** Examples

data(AREDS)
# fit a Copula2-Sieve model
copula2_sp <- ic_spTran_copula(data = AREDS, copula = "Copula2",
              l = 0, u = 15, m = 3, r = 3,
              var_list = c("ENROLLAGE","rs2284665","SevScaleBL"))
newdata = data.frame(id = rep(1:3, each=2), ind = rep(c(1,2),3),
                     SevScaleBL = rep(3,6), ENROLLAGE = rep(60,6),
                     rs2284665 = c(0,0,1,1,2,2))
# Plot marginal survival probabilities
plot(x = copula2_sp, class = "marginal",
     newdata = newdata[newdata$id==1,],
     plot_margin = 1, ylim = c(0.6,1),
     ylab = "Marginal Survival Probability")
lines(x = copula2_sp, class = "marginal",
      newdata = newdata[newdata$id==2,],
      plot_margin = 1, lty = 2)
legend("bottomleft", c("id: 1","id: 2"), lty = c(1,2))

# Plot conditional survival probabilities
plot(x = copula2_sp, class = "conditional",
     newdata = newdata[newdata$id==1,],
     cond_margin = 2, cond_time = 5, ylim = c(0.25,1),
     xlab = "years", ylab = "Conditional Survival Probability")
lines(x = copula2_sp, class = "conditional",
      newdata = newdata[newdata$id==2,],
     cond_margin = 2, cond_time = 5, lty = 2)
legend("bottomleft", c("id: 1","id: 2"), lty = c(1,2))

# Plot joint survival probabilities
plot3d <- plot(x = copula2_sp, class = "joint",
               newdata = newdata[newdata$id==1,])
plot3d <- lines(x = copula2_sp, class = "joint",
                newdata = newdata[newdata$id==2,], plotly_object = plot3d)



