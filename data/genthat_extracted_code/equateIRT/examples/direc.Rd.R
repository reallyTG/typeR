library(equateIRT)


### Name: direc
### Title: Direct Equating Coefficients
### Aliases: direc print.eqc

### ** Examples

# three-parameter logistic model
# direct equating coefficients between forms 1 and 2 using the Stocking-Lord method
data(est3pl)
test <- paste("test", 1:5, sep = "")
mod3pl <- modIRT(coef = est3pl$coef, var = est3pl$var, names = test, display = FALSE)
l12 <- direc(mods = mod3pl, which = c("test1", "test2"), method = "Stocking-Lord")
summary(l12)

# two-parameter logistic model
# direct equating coefficients between forms 1 and 5 using the Haebara method
data(est2pl)
test <- paste("test", 1:5, sep = "")
mod2pl <- modIRT(coef = est2pl$coef, var = est2pl$var, names = test, display = FALSE)
l15 <- direc(mods = mod2pl, which = c(1,5), method = "Haebara")
summary(l15)

# Rasch model
# direct equating coefficients between forms 5 and 4 using the mean-mean method
data(estrasch)
test <- paste("test", 1:5, sep = "")
modrasch <- modIRT(coef = estrasch$coef, var = estrasch$var, names = test, 
	display = FALSE)
l54 <- direc(mods = modrasch, which = c(5,4), method = "mean-mean")
summary(l54)



