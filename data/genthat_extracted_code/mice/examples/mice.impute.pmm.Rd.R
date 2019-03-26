library(mice)


### Name: mice.impute.pmm
### Title: Imputation by predictive mean matching
### Aliases: mice.impute.pmm pmm
### Keywords: datagen

### ** Examples

# We normally call mice.impute.pmm() from within mice()
# But we may call it directly as follows (not recommended)

set.seed(53177)
xname <- c('age', 'hgt', 'wgt')
r <- stats::complete.cases(boys[, xname])
x <- boys[r, xname]
y <- boys[r, 'tv']
ry <- !is.na(y)
table(ry)

# percentage of missing data in tv
sum(!ry) / length(ry)

# Impute missing tv data
yimp <- mice.impute.pmm(y, ry, x)
length(yimp)
hist(yimp, xlab = 'Imputed missing tv')

# Impute all tv data
yimp <- mice.impute.pmm(y, ry, x, wy = rep(TRUE, length(y)))
length(yimp)
hist(yimp, xlab = 'Imputed missing and observed tv')
plot(jitter(y), jitter(yimp), 
    main = 'Predictive mean matching on age, height and weight', 
    xlab = 'Observed tv (n = 224)',
    ylab = 'Imputed tv (n = 224)')
abline(0, 1)
cor(y, yimp, use = 'pair')



