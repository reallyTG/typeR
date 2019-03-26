library(JointAI)


### Name: add_samples
### Title: Add samples to an object of class JointAI
### Aliases: add_samples

### ** Examples

# Example 1:
# run an initial JointAI model:
mod <- lm_imp(y~C1 + C2 + M2, data = wideDF, n.iter = 100)

# continue sampling
mod_add <- add_samples(mod, n.iter = 200, add = TRUE)


# Example 2:
# continue sampling, but additionally sample imputed values
imps <- add_samples(mod, n.iter = 200, monitor_params = c("imps" = TRUE),
                    add = FALSE)





