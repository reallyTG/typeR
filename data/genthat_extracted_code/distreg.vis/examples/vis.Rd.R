library(distreg.vis)


### Name: vis
### Title: distreg.vis function
### Aliases: vis

### ** Examples

library("gamlss")
library("bamlss")
# A gamlss model
normal_gamlss <- gamlss(NO ~ binomial1 + ps(norm2),
                        sigma.formula = ~ binomial1 + ps(norm2),
                        data = model_fam_data(),
                        trace = FALSE)

# Start the App - only in interactive modes
if (interactive()) {
distreg.vis::vis()
}



