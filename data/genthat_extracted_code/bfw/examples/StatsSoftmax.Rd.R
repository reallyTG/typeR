library(bfw)


### Name: StatsSoftmax
### Title: Softmax Regression
### Aliases: StatsSoftmax

### ** Examples

# Conduct softmax regression on Cats data
# Reward is 0 = Food and 1 = Dance
## No test: 
mcmc <- bfw(project.data = bfw::Cats,
            y = "Alignment",
            x = "Ratings,Reward",
            saved.steps = 50000,
            jags.model = "softmax",
            jags.seed = 100,
            silent = TRUE)
## End(No test)
# Conduct binominal generalized linear model
model <- glm(Alignment ~ Ratings + Reward, data=bfw::Cats, family = binomial(link="logit"))

# Print output from softmax
#' \donttest{ mcmc$summary.MCMC }
#                                   Mean     Median          Mode   ESS     HDIlo     HDIhi    n
#beta0[1]: Intercept: Evil     0.0000000  0.0000000 -0.0006069443     0  0.000000  0.000000 2000
#beta0[2]: Intercept: Good    -7.6900266 -7.6842450 -7.6591980566 17693 -8.471740 -6.917770 2000
#beta[1,1]: Evil vs. Ratings   0.0000000  0.0000000 -0.0006069443     0  0.000000  0.000000 2000
#beta[2,1]: Good vs. Ratings   1.2891109  1.2884400  1.2834031862 19614  1.187080  1.387420 2000
#beta[1,2]: Evil vs. Reward    0.0000000  0.0000000 -0.0006069443     0  0.000000  0.000000 2000
#beta[2,2]: Good vs. Reward    1.2755419  1.2748600  1.2792090358 20807  0.961217  1.596540 2000
#zbeta0[1]: Intercept: Evil    0.0000000  0.0000000 -0.0006069443     0  0.000000  0.000000 2000
#zbeta0[2]: Intercept: Good   -1.0307617 -1.0300500 -1.0241784961 22812 -1.185420 -0.870468 2000
#zbeta[1,1]: Evil vs. Ratings  0.0000000  0.0000000 -0.0006069443     0  0.000000  0.000000 2000
#zbeta[2,1]: Good vs. Ratings  2.4755475  2.4742500  2.4645858712 19614  2.279560  2.664290 2000
#zbeta[1,2]: Evil vs. Reward   0.0000000  0.0000000 -0.0006069443     0  0.000000  0.000000 2000
#zbeta[2,2]: Good vs. Reward   0.5005214  0.5002545  0.5019603414 20807  0.377181  0.626482 2000

# Print (truncated) output from GML
# Coefficients:
#               Estimate   Std. Error z value Pr(>|z|)
#(Intercept)     -6.39328    0.27255 -23.457  < 2e-16 ***
#Ratings          1.28480    0.05136  25.014  < 2e-16 ***
#RewardAffection  1.26975    0.16381   7.751  9.1e-15 ***



