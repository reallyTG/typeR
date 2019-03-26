library(glmertree)


### Name: MHserviceDemo
### Title: Artificial mental-health service outcomes dataset
### Aliases: MHserviceDemo
### Keywords: datasets

### ** Examples

## No test: 
data("MHserviceDemo", package = "glmertree")
summary(MHserviceDemo)
lt <- lmertree(outcome ~ 1 | cluster_id | age + gender + emotional + 
               autism + impact + conduct, data = MHserviceDemo)
plot(lt)

gt <- glmertree(factor(outcome > 0) ~ 1 | cluster_id | age + gender + 
                emotional + autism + impact + conduct, 
                data = MHserviceDemo, family = "binomial")
plot(gt)
## End(No test)



