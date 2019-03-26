library(mokken)


### Name: mokken-package
### Title: Mokken Scale Analysis
### Aliases: mokken-package mokken
### Keywords: package

### ** Examples


# Personality test
data(acl)               

# Select the items of the scale Communality
Communality <- acl[,1:10]

# Compute scalability coefficients
coefH(Communality)

# Investigate the assumption of monotonicity
monotonicity.list <- check.monotonicity(Communality)
summary(monotonicity.list)
plot(monotonicity.list)

# Investigate the assumption of non-intersecting ISRFs using method restscore
restscore.list <- check.restscore(Communality)
summary(restscore.list)
plot(restscore.list)

# Investigate the assumption of non-intersecting ISRFs using method pmatrix
pmatrix.list <- check.pmatrix(Communality)
summary(pmatrix.list)
plot(pmatrix.list)

# Investigate the assumption of IIO using method MIIO
iio.list <- check.iio(Communality)
summary(iio.list)
plot(iio.list)

# Compute the reliability of the scale
check.reliability(Communality)

# Partition the the scale into mokken scales
aisp(Communality)




