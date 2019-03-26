library(icenReg)


### Name: survCIs
### Title: Confidence/Credible intervals for survival curves
### Aliases: survCIs

### ** Examples

data("IR_diabetes")
fit <- ic_par(cbind(left, right) ~ gender, 
                data = IR_diabetes)

# Getting confidence intervals for survival curves
# for males and females
newdata <- data.frame(gender = c("male", "female"))
rownames(newdata) <- c("Males", "Females")
diab_cis <- survCIs(fit, newdata)
diab_cis

# Can add this to any plot
plot(fit, newdata = newdata, 
     cis = FALSE)
# Would have been included by default
lines(diab_cis, col = c("black", "red"))



