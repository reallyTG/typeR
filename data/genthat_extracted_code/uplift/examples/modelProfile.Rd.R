library(uplift)


### Name: modelProfile
### Title: Profile a Fitted Uplift Model
### Aliases: modelProfile
### Keywords: tables

### ** Examples


library(uplift)

### Simulate data
set.seed(12345)
dd <- sim_pte(n = 1000, p = 5, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd$treat <- ifelse(dd$treat == 1, 1, 0) # required coding for upliftRF

### Fit upliftRF model
fit1 <- upliftRF(y ~ X1 + X2 + X3 + X4 + X5 + trt(treat),
                 data = dd, 
                 mtry = 3,
                 ntree = 50, 
                 split_method = "KL",
                 minsplit = 100, 
                 verbose = TRUE)

### Fitted values on train data
pred <- predict(fit1, dd)

### Compute uplift predictions
uplift_pred <- pred[, 1] - pred[, 2]

### Put together data, predictions and add some dummy factors for illustration only
dd2 <- data.frame(dd, uplift_pred, F1 = gl(2, 50, labels = c("A", "B")), 
                  F2 = gl(4, 25, labels = c("a", "b", "c", "d")))
                     
### Profile data based on fitted model
modelProfile(uplift_pred ~ X1 + X2 + X3 + F1 + F2, 
             data = dd2, 
             groups = 10,
             group_label = "D", 
             digits_numeric = 2,
             digits_factor = 4,
             exclude_na = FALSE, 
             LaTex = FALSE)




