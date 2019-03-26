library(glmertree)


### Name: DepressionDemo
### Title: Artificial depression treatment dataset
### Aliases: DepressionDemo
### Keywords: datasets

### ** Examples

## No test: 
data("DepressionDemo", package = "glmertree")
summary(DepressionDemo)
lt <- lmertree(depression ~ treatment | cluster | anxiety + duration + age, 
        data = DepressionDemo)
plot(lt)
gt <- glmertree(depression_bin ~ treatment | cluster | anxiety + duration + age, 
        data = DepressionDemo)
plot(gt)
## End(No test)



