library(mvord)


### Name: mvord
### Title: Multivariate Ordinal Regression Models.
### Aliases: mvord

### ** Examples

library(mvord)

#toy example
data(data_mvord_toy)

#wide data format with MMO2
res <- mvord(formula = MMO2(Y1, Y2) ~ 0 + X1 + X2,
             data = data_mvord_toy)
print(res)
summary(res)
thresholds(res)
coefficients(res)
head(error_structure(res))

# convert data_mvord_toy into long format
df <- cbind.data.frame("i" = rep(1:100,2), "j" = rep(1:2,each = 100),
                       "Y" = c(data_mvord_toy$Y1,data_mvord_toy$Y2),
                       "X1" = rep(data_mvord_toy$X1,2),
                       "X2" = rep(data_mvord_toy$X2,2))

#for long format data, use MMO instead of MMO2
res <- mvord(formula = MMO(Y, i, j) ~ 0 + X1 + X2, #or formula = MMO(Y) ~ 0 + X1 + X2
               data = df)
print(res)
summary(res)
thresholds(res)
coefficients(res)
head(error_structure(res))
## No test: 
res2 <- mvord(formula = MMO(Y) ~ 0 + X1 + X2,
               data = df,
               control = mvord.control(solver = "BFGS"),
               threshold.constraints = c(1,1),
               coef.constraints = c(1,1))
print(res2)
summary(res2)
thresholds(res2)
coefficients(res2)
head(error_structure(res2))

## examples
#load data
data(data_mvord)
head(data_mvord)

#-------------
# cor_general
#-------------
# approx 2 min
res_cor <- mvord(formula = MMO(rating) ~ 0 + X1 + X2 + X3 + X4 + X5,
                 data = data_mvord,
                 coef.constraints = cbind(c(1,2,2),
                                          c(1,1,2),
                                          c(NA,1,2),
                                          c(NA,NA,NA),
                                          c(1,1,2)),
                 coef.values = cbind(c(NA,NA,NA),
                                     c(NA,NA,NA),
                                     c(0,NA,NA),
                                     c(1,1,1),
                                     c(NA,NA,NA)),
                 threshold.constraints = c(1,1,2),
                 control = mvord.control(solver = "newuoa"))
print(res_cor)
summary(res_cor)
thresholds(res_cor)
coefficients(res_cor)
head(error_structure(res_cor))

#-------------
# cov_general
#-------------
#approx 4 min
res_cov <- mvord(formula = MMO(rating) ~ 1 + X1 + X2 + X3 + X4 + X5,
                 data = data_mvord,
                 error.structure = cov_general(~1),
                 threshold.values = list(c(-4,NA,NA,NA,NA,4.5),
                                         c(-4,NA,NA,NA,NA,4),
                                         c(-5,NA,NA,NA,NA,NA,4.5))
) #does not converge with BFGS

print(res_cov)
summary(res_cov)
thresholds(res_cov)
coefficients(res_cov)
head(error_structure(res_cov))


#-------------
# cor_ar1
#-------------
#approx 4min
data(data_mvord_panel)
head(data_mvord_panel)

#select subset of data
subset_dat <- data_mvord_panel$year %in% c("year3", "year4", "year5", "year6", "year7")
data_mvord_panel <- data_mvord_panel[subset_dat,]

mult.obs <- 5
res_AR1 <- mvord(formula = MMO(rating) ~ 0 + X1 + X2 + X3 + X4 + X5,
                 data = data_mvord_panel,
                 error.structure = cor_ar1(~1),
                 threshold.constraints = c(1,1,1,2,2),
                 coef.constraints = c(1,1,1,2,2),
                 control = mvord.control(solver = "BFGS"))
print(res_AR1)
summary(res_AR1)
thresholds(res_AR1)
coefficients(res_AR1)
head(error_structure(res_AR1))
head(error_structure(res_AR1, type = "corr"))

data(data_mvord2)
# approx 2 min
res_cor <- mvord(formula = MMO2(rater1, rater2, rater3) ~ 0 + X1 + X2 + X3 + X4 + X5,
                 data = data_mvord2,
                 coef.constraints = cbind(c(1,2,2),
                                          c(1,1,2),
                                          c(NA,1,2),
                                          c(NA,NA,NA),
                                          c(1,1,2)),
                 coef.values = cbind(c(NA,NA,NA),
                                     c(NA,NA,NA),
                                     c(0,NA,NA),
                                     c(1,1,1),
                                     c(NA,NA,NA)),
                 threshold.constraints = c(1,1,2),
                 control = mvord.control(solver = "newuoa"))
print(res_cor)
summary(res_cor)
thresholds(res_cor)
coefficients(res_cor)
head(error_structure(res_cor))
## End(No test)




