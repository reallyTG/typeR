library(rddtools)


### Name: rdd_pred
### Title: RDD coefficient prediction
### Aliases: rdd_pred

### ** Examples

# Load data, add (artificial) covariates:
data(house)
n_Lee <- nrow(house)
z1 <- runif(n_Lee)
house_rdd <- rdd_data(y=y, x=x, data=house, covar=z1, cutpoint=0)

# estimation without covariates: rdd_pred is the same than rdd_coef:
reg_para <- rdd_reg_lm(rdd_object=house_rdd)

rdd_pred(reg_para)
rdd_coef(reg_para, allInfo=TRUE)

# estimation with covariates:
reg_para_cov <- rdd_reg_lm(rdd_object=house_rdd,
                          covariates='z1',
                          covar.opt=list(slope='separate') )

# should obtain same result as with RDestimate
rdd_pred(reg_para_cov, covdata=data.frame(z1=0))

# evaluate at mean of z1 (as comes from uniform)
rdd_pred(reg_para_cov, covdata=data.frame(z1=0.5))



