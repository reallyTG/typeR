library(walker)


### Name: plot_predict
### Title: Prediction intervals for walker object
### Aliases: plot_predict

### ** Examples

set.seed(1)
n <- 60
slope <- 0.0001 + cumsum(rnorm(n, 0, sd = 0.01))
beta <- numeric(n)
beta[1] <- 1
for(i in 2:n) beta[i] <- beta[i-1] + slope[i-1]
ts.plot(beta)                
x <- rnorm(n, 1, 0.5)
alpha <- 2
ts.plot(beta * x)

signal <- alpha + beta * x
y <- rnorm(n, signal, 0.25)
ts.plot(cbind(signal, y), col = 1:2)
data_old <- data.frame(y = y[1:(n-10)], x = x[1:(n-10)])
rw2_fit <- walker(y ~ 1 + 
                    rw2(~ -1 + x,
                        beta_prior = c(0, 10), 
                        sigma_prior = c(0, 10), 
                        slope_prior = c(0, 10)), 
                  sigma_y_prior = c(0, 10), 
                  beta_prior = c(0, 10),
                  iter = 400, chains = 1, data = data_old)

pred <- predict(rw2_fit, newdata = data.frame(x=x[(n-9):n]))
data_new <- data.frame(t = (n-9):n, y = y[(n-9):n])
plot_predict(pred) + 
  geom_line(data=data_new, aes(t, y), linetype="dashed", colour = "red", inherit.aes = FALSE)




