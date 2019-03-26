library(broom)


### Name: glance.rlm
### Title: Glance at a(n) rlm object
### Aliases: glance.rlm rlm_tidiers

### ** Examples


library(MASS)

r <- rlm(stack.loss ~ ., stackloss)
tidy(r)
augment(r)
glance(r)




