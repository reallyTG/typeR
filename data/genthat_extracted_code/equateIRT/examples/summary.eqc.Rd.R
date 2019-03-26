library(equateIRT)


### Name: summary.eqc
### Title: Summarizing Estimated Equating Coefficients
### Aliases: summary.eqc print.summary.eqc

### ** Examples

# three-parameter logistic model
# direct equating coefficients between forms 1 and 2 using the Stocking-Lord method
data(est3pl)
test <- paste("test", 1:5, sep = "")
mod3pl <- modIRT(coef = est3pl$coef, var = est3pl$var, names = test, display = FALSE)
l12 <- direc(mod1 = mod3pl[1], mod2 = mod3pl[2], method = "Stocking-Lord")
summary(l12)



