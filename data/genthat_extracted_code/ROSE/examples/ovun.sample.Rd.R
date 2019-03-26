library(ROSE)


### Name: ovun.sample
### Title: Over-sampling, under-sampling, combination of over- and
###   under-sampling.
### Aliases: ovun.sample

### ** Examples


# 2-dimensional example
# loading data
data(hacide)

# imbalance on training set
table(hacide.train$cls)

# balanced data set with both over and under sampling
data.balanced.ou <- ovun.sample(cls~., data=hacide.train,
                                N=nrow(hacide.train), p=0.5, 
                                seed=1, method="both")$data

table(data.balanced.ou$cls)

# balanced data set with over-sampling
data.balanced.over <- ovun.sample(cls~., data=hacide.train, 
                                  p=0.5, seed=1, 
                                  method="over")$data

table(data.balanced.over$cls)




