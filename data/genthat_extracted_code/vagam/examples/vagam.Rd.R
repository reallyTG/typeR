library(vagam)


### Name: vagam
### Title: Fitting generalized additive models (GAMs) using variational
###   approximations (VA).
### Aliases: vagam
### Keywords: methods

### ** Examples

## Example 1: Application to wage data
data(wage_data)

south_code <- gender_code <- race_code <- union_code <- vector("numeric", nrow(wage_data))
union_code[wage_data$union == "member"] <- 1
south_code[wage_data$south == "yes"] <- 1
gender_code[wage_data$gender == "female"] <- 1
race_code[wage_data$race == "White"] <- 1
para.X <- data.frame(south = south_code, gender = gender_code, race = race_code)

fit_va <- vagam(y = union_code, smooth.X = wage_data[,c("education", "wage", "age")],
                       para.X = para.X,
                       int.knots = 8, save.data = TRUE, 
                       family = binomial(), 
                       para.se = TRUE)
summary(fit_va)

a <- 1
par(mfrow = c(1, 3), las = 1, cex = a, cex.lab = a+0.2, cex.main = a+0.5, mar = c(5,5,3,2))
plot(fit_va, ylim = c(-2.7, 2.7), select = 1, 
                        xlab = "Education", ylab = "Smooth of Education", lwd = 3)
plot(fit_va, ylim = c(-2.7, 2.7), select = 2, 
                        xlab = "Wage", ylab = "Smooth of Wage", main = "Plots from VA-GAM", lwd = 3)
plot(fit_va, ylim = c(-2.7, 2.7), select = 3, 
                        xlab = "Age", ylab = "Smooth of Age", lwd = 3)

                      
## Not run: 
##D ## Example 2: Simulated data with size = 50 and compare how GAMs can be fitted 
##D ## in VA and mgcv (which uses penalized quasi-likelihood)
##D choose_k <- 5 * ceiling(50^0.2)
##D true_beta <- c(-1, 0.5)
##D 
##D poisson_dat <- gamsim(n = 50, dist = "poisson", extra.X = data.frame(intercept = rep(1,50), 
##D                         treatment = rep(c(0,1), each = 50/2)), beta = true_beta)
##D 
##D ## GAM using VA
##D fit_va <- vagam(y = poisson_dat$y, smooth.X = poisson_dat[,2:5], 
##D 		         para.X = data.frame(treatment = poisson_dat$treatment), 
##D                           int.knots = choose_k, save.data = TRUE, family = poisson(), 
##D                           para.se = TRUE)
##D summary(fit_va)
##D                        
##D ## GAM using mgcv with default options
##D fit_mgcv1 <- gam(y ~ treatment + s(x0) + s(x1) + s(x2) + s(x3), 
##D                              data = poisson_dat, family = poisson())
##D 
##D 
##D ## GAM using mgcv with P-splines and preset knots; 
##D ## this is equivalent to VA in terms of the splines bases functions 
##D fit_mgcv2 <- gam(y ~ treatment + s(x0, bs = "ps", k = round(choose_k/2) + 2, m  = c(2,1)) + 
##D                              s(x1, bs = "ps", k = round(choose_k/2) + 2, m  = c(2,1)) + 
##D                              s(x2, bs = "ps", k = round(choose_k/2) + 2, m  = c(2,1)) + 
##D                              s(x3, bs = "ps", k = round(choose_k/2) + 2, m  = c(2,1)), 
##D                              data = poisson_dat, family = poisson())                     
## End(Not run)



