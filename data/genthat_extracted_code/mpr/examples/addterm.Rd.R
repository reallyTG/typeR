library(mpr)


### Name: addterm
### Title: All Possible Single-Term Additions to / Deletions from a
###   Multi-Parameter Regression (MPR) Model
### Aliases: addterm dropterm

### ** Examples

# Veterans' administration lung cancer data
data(veteran, package="survival")
head(veteran)

# null model
mod1 <- mpr(Surv(time, status) ~ list(~ 1, ~ 1), data=veteran)
mod1 # family = "Weibull" by default

# consider adding trt and celltype to component 1 
addterm(mod1, ~ trt + celltype, comp=1)

# consider adding trt and celltype to components 1 and 2 simultaneously
addterm(mod1, ~ trt + celltype, comp=1:2)$modeltab

# further examples
mod2 <- mpr(Surv(time, status) ~ list(~ trt + celltype, ~ trt + karno),
            data=veteran)
dropterm(mod2, ~ 1, comp=1:2)$modeltab
dropterm(mod2, ~ 1, comp=1)$modeltab
dropterm(mod2, ~ 1, comp=2)$modeltab

# does nothing since celltype is only in component 1
dropterm(mod2, ~ . - celltype, comp=1:2)$modeltab 

# removes celltype from component 1
dropterm(mod2, ~ . - celltype, comp=1)$modeltab



