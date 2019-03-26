library(ALSM)


### Name: onerandom
### Title: one random effect model
### Aliases: onerandom

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (y, treatment, alpha)
{
    treatment <- factor(treatment)
    aov = Anova(lm(y ~ treatment), type = 2)
    mse2 <- aov[, 1]/aov[, 2]
    mse <- mse2[2]
    mstr <- mse2[1]
    r <- aov[1, 2] + 1
    n <- (aov[2, 2] + r)/r
    s <- sqrt(mstr/(r * n))
    lower <- mean(y) - qt(1 - alpha/2, r - 1) * s
    upper <- mean(y) + qt(1 - alpha/2, r - 1) * s
    out.mu <- cbind(estimate = mean(y), lower = lower, upper = upper)
    l = ((mstr/mse) * (1/qf(1 - alpha/2, r - 1, r * (n - 1))) -
        1)/n
    u = ((mstr/mse) * (1/qf(alpha/2, r - 1, r * (n - 1))) - 1)/n
    lower <- l/(l + 1)
    upper <- u/(1 + u)
    out.prop.sigma2.mu <- cbind(lower = lower, upper = upper)
    lower <- (r * (n - 1) * mse)/(qchisq(1 - alpha/2, r * (n -
        1)))
    upper <- (r * (n - 1) * mse)/(qchisq(alpha/2, r * (n - 1)))
    out.sigma2 <- cbind(lower = lower, upper = upper)
    out1 <- satterthwaite(c = c(1/n, -1/n), MSE = c(mstr, mse),
        df = c(r - 1, r * (n - 1)), alpha = alpha)
    out2 <- MLS(MSE1 = mstr, df1 = r - 1, c1 = 1/n, MSE2 = mse,
        df2 = r * (n - 1), c2 = -1/n, alpha = alpha)
    o <- list(anova = aov, mu = out.mu, prop.sigma2.mu = out.prop.sigma2.mu,
        sigma2 = out.sigma2, sigma2.mu.satterthwaite = out1,
        sigma2.mu.MLS = out2)
    return(o)
  }



