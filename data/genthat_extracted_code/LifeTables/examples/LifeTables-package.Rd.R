library(LifeTables)


### Name: LifeTables-package
### Title: HMD Model Life Tables
### Aliases: LifeTables-package LifeTables
### Keywords: package

### ** Examples


# first get the appropriate family #
hmd.DA(x=.09, sex="male", child.mort=4, adult.mort=.28)$classification

# then get the appropriate level (alpha) #
alpha.e0(pattern=1, e0.target=59, sex="male")

# put in the family and alpha to model to produce complete schedule #
mortmod(pattern=1, alpha=.034, sex="male")



