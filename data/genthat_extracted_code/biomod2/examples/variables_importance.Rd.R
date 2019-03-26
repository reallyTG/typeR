library(biomod2)


### Name: variables_importance
### Title: Variables importance calculation
### Aliases: variables_importance
### Keywords: suffle random importance

### ** Examples

xx <- data.frame( a=sample(c(0,1),100,replace=TRUE),
                  b=rnorm(100),
                  c=1:100)

mod <- glm(a~b+c, data=xx)

variables_importance(model=mod, data=xx[,c('b','c')], method="full_rand", nb_rand=3)




