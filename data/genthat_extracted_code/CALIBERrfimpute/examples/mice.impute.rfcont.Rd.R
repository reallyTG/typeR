library(CALIBERrfimpute)


### Name: mice.impute.rfcont
### Title: Impute continuous variables using Random Forest within MICE
### Aliases: mice.impute.rfcont

### ** Examples

set.seed(1)

# A small dataset with a single row to be imputed
mydata <- data.frame(x1 = c(2, 3, NA, 4, 5, 1, 6, 8, 7, 9), x2 = 1:10,
    x3 = c(1, 3, NA, 4, 2, 8, 7, 9, 6, 5))
mice(mydata, method = c('norm', 'norm', 'norm'), m = 2, maxit = 2)
mice(mydata[, 1:2], method = c('rfcont', 'rfcont'), m = 2, maxit = 2)
mice(mydata, method = c('rfcont', 'rfcont', 'rfcont'), m = 2, maxit = 2)

# A larger simulated dataset
mydata <- simdata(100)
cat('\nSimulated multivariate normal data:\n')
print(data.frame(mean = colMeans(mydata), sd = sapply(mydata, sd)))

# Apply missingness pattern
mymardata <- makemar(mydata)
cat('\nNumber of missing values:\n')
print(sapply(mymardata, function(x){sum(is.na(x))}))

# Test imputation of a single column in a two-column dataset
cat('\nTest imputation of a simple dataset')
print(mice(mymardata[, c('y', 'x1')], method = 'rfcont'))

# Analyse data
cat('\nFull data analysis:\n')
print(summary(lm(y ~ x1 + x2 + x3, data=mydata)))

cat('\nMICE using normal-based linear regression:\n')
print(summary(pool(with(mice(mymardata,
    method = 'norm'), lm(y ~ x1 + x2 + x3)))))

# Set options for Random Forest
setRFoptions(ntree_cont = 10)

cat('\nMICE using Random Forest:\n')
print(summary(pool(with(mice(mymardata,
    method = 'rfcont'), lm(y ~ x1 + x2 + x3)))))



