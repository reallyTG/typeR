library(mpr)


### Name: update.mpr
### Title: Update and Re-fit a Multi-Parameter Regression (MPR) Model Call
### Aliases: update.mpr

### ** Examples

# Veterans' administration lung cancer data
data(veteran, package="survival")
head(veteran)

# Weibull MPR treatment model
mod1 <- mpr(Surv(time, status) ~ list(~ trt, ~ trt), data=veteran,
            family="Weibull")

# remove trt from first component
update(mod1, ~ . - trt, comp=1)
update(mod1, list(~ . - trt, ~ .))

# remove trt from both components
update(mod1, ~ . - trt, comp=1:2)
update(mod1, list(~ . - trt, ~ . - trt))

# add celltype to second component
update(mod1, ~ . + celltype, comp=2)
update(mod1, list(~ . , ~ . + celltype))

# simultaneously remove trt from first component and add celltype to second
# component. This is only possible using the approach where "new" is a list. 
update(mod1, list(~ . - trt, ~ . + celltype))

# can also update other things, e.g. "family"
update(mod1, ~ ., family="Gompertz")
update(mod1, ~ . + celltype, family="Loglogistic")

mod2 <- update(mod1, ~ ., family="Burr") # change to Burr model
mod2
update(mod2, ~ . + celltype, comp=2:3) # add celltype to components 2 and 3



