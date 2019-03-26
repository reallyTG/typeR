library(CALIBERrfimpute)


### Name: mice.impute.rfcat
### Title: Impute categorical variables using Random Forest within MICE
### Aliases: mice.impute.rfcat

### ** Examples

set.seed(1)

# A small sample dataset 
mydata <- data.frame(
    x1 = as.factor(c('this', 'this', NA, 'that', 'this')),
    x2 = 1:5,
    x3 = c(TRUE, FALSE, TRUE, NA, FALSE))
mice(mydata, method = c('logreg', 'norm', 'logreg'), m = 2, maxit = 2)
mice(mydata[, 1:2], method = c('rfcat', 'rfcont'), m = 2, maxit = 2)
mice(mydata, method = c('rfcat', 'rfcont', 'rfcat'), m = 2, maxit = 2)

# A larger simulated dataset
mydata <- simdata(100, x2binary = TRUE)
mymardata <- makemar(mydata)

cat('\nNumber of missing values:\n')
print(sapply(mymardata, function(x){sum(is.na(x))}))

# Test imputation of a single column in a two-column dataset
cat('\nTest imputation of a simple dataset')
print(mice(mymardata[, c('y', 'x2')], method = 'rfcat'))

# Analyse data
cat('\nFull data analysis:\n')
print(summary(lm(y ~ x1 + x2 + x3, data = mydata)))

cat('\nMICE normal and logistic:\n')
print(summary(pool(with(mice(mymardata,
    method = c('', 'norm', 'logreg', '', '')), lm(y ~ x1 + x2 + x3)))))

# Set options for Random Forest
setRFoptions(ntree_cat = 10)

cat('\nMICE using Random Forest:\n')
print(summary(pool(with(mice(mymardata,
    method = c('', 'rfcont', 'rfcat', '', '')), lm(y ~ x1 + x2 + x3)))))

cat('\nDataset with unobserved levels of a factor\n')
data3 <- data.frame(x1 = 1:100, x2 = factor(c(rep('A', 25),
    rep('B', 25), rep('C', 25), rep('D', 25))))
data3$x2[data3$x2 == 'D'] <- NA
mice(data3, method = c('', 'rfcat'))



