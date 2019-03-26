library(TANDEM)


### Name: relative.contributions
### Title: Determine the relative contribution per data type
### Aliases: relative.contributions

### ** Examples

## simple example
# unpack example data
x = example_data$x
y = example_data$y
upstream = example_data$upstream
data_types = example_data$data_types

# fit TANDEM model
fit = tandem(x, y, upstream, alpha=0.5)

# assess the relative contribution of upstream and downstream features
contr = relative.contributions(fit, x, data_types)
barplot(contr, ylab="Relative contribution", ylim=0:1)

## comparing TANDEM and classic model (glmnet)
# unpack example data
x = example_data$x
y = example_data$y
upstream = example_data$upstream
data_types = example_data$data_types

# fix the cv folds, to facilitate a comparison between models
set.seed(1)
n = nrow(x)
nfolds = 10
foldid = ceiling(sample(1:n)/n * nfolds)

# fit both a TANDEM and a classic model (glmnet)
fit = tandem(x, y, upstream, alpha=0.5)
library(glmnet)
fit2 = cv.glmnet(x, y, alpha=0.5, foldid=foldid)

# assess the relative contribution of upstream and downstream features
# using both methods
contr_tandem = relative.contributions(fit, x, data_types)
contr_glmnet = relative.contributions(fit2, x, data_types)
par(mfrow=c(1,2))
barplot(contr_tandem, ylab="Relative contribution", main="TANDEM", ylim=0:1)
barplot(contr_glmnet, ylab="Relative contribution", main="Classic approach", ylim=0:1)
par(mfrow=c(1,1))



