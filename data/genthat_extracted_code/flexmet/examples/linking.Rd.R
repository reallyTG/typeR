library(flexmet)


### Name: linking
### Title: Linear and Nonlinear Item Parameter Linking
### Aliases: linking sl_link hb_link

### ** Examples


set.seed(2342)
bmat <- sim_bmat(n_items = 20, k = 2)$bmat

theta1 <- rnorm(100)
theta2 <- rnorm(100, mean = -1)

dat1 <- sim_data(bmat = bmat, theta = theta1)
dat2 <- sim_data(bmat = bmat, theta = theta2)

# estimate each model with fixed-effects and k = 0
fmp0_1 <- fmp(dat = dat1, k = 0, em = FALSE)
fmp0_2 <- fmp(dat = dat2, k = 0, em = FALSE)

# Stocking-Lord linking

sl_res <- sl_link(bmat1 = fmp0_1$bmat[1:5, ],
                  bmat2 = fmp0_2$bmat[1:5, ],
                  k_theta = 0)

## Not run: 
##D hb_res <- hb_link(bmat1 = fmp0_1$bmat[1:5, ],
##D                   bmat2 = fmp0_2$bmat[1:5, ],
##D                   k_theta = 0)
## End(Not run)






