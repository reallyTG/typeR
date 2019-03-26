library(rstanarm)


### Name: neg_binomial_2
### Title: Family function for negative binomial GLMs
### Aliases: neg_binomial_2

### ** Examples

if (!grepl("^sparc",  R.version$platform))
stan_glm(Days ~ Sex/(Age + Eth*Lrn), data = MASS::quine, seed = 123,
         family = neg_binomial_2, QR = TRUE, algorithm = "optimizing") 
                
# or, equivalently, call stan_glm.nb() without specifying the family




