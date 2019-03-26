library(FinePop)


### Name: FstEnv
### Title: Regression analysis of environmental factors on genetic
###   differentiation
### Aliases: FstEnv

### ** Examples

# Example of genotypic and environmental dataset
data(herring)

# Data bootstrapping and Fst estimation
# fstbs <- FstBoot(herring$popdata)

# Effects of environmental factors on genetic differentiation
# fstenv <- FstEnv(fstbs, herring$environment, herring$distance)

# Since these calculations are too heavy, pre-calculated results are included in this dataset.
fstbs <- herring$fst.bootstrap
fstenv <- herring$fst.env
summary(fstenv)



