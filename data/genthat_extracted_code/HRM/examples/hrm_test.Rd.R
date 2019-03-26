library(HRM)


### Name: hrm_test
### Title: Test for Multi-Factor High-Dimensional Repeated Measures
### Aliases: hrm_test hrm_test.list hrm_test.data.frame
### Keywords: export

### ** Examples

## hrm_test with a list of matrices

# number patients per group
n = c(10,10)
# number of groups
a=2
# number of variables
d=40

# defining the list consisting of the samples from each group
mu_1 = mu_2 = rep(0,d)
# autoregressive covariance matrix
sigma_1 = diag(d)
for(k in 1:d) for(l in 1:d) sigma_1[k,l] = 1/(1-0.5^2)*0.5^(abs(k-l))
sigma_2 = 1.5*sigma_1
X = list(mvrnorm(n[1],mu_1, sigma_1), mvrnorm(n[2],mu_2, sigma_2))
X=lapply(X, as.matrix)

hrm_test(data=X, alpha=0.05)


## hrm.test with a data.frame using a 'formula' object

# using the EEG dataset
?EEG

hrm_test(value ~ group*region*variable, subject = "subject", data = EEG)



