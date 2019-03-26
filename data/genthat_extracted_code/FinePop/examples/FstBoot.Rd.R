library(FinePop)


### Name: FstBoot
### Title: Bootstrap sampler of Fst
### Aliases: FstBoot

### ** Examples

# Example of genotypic and environmental dataset
data(herring)

# Data bootstrapping and Fst estimation
# fstbs <- FstBoot(herring$popdata)

# Effects of environmental factors on genetic differentiation
# fstenv <- FstEnv(fstbs, herring$environment, herring$distance)

# Since these calculations are too heavy, pre-caluculated results are included in this dataset.
fstbs <- herring$fst.bootstrap
fstenv <- herring$fst.env
summary(fstenv)



