library(fitdistrplus)


### Name: smokedfish
### Title: Contamination data of Listeria monocytogenes in smoked fish
### Aliases: smokedfish
### Keywords: datasets

### ** Examples

# (1) load of data
#
data(smokedfish)

# (2) plot of data in CFU/g
#
plotdistcens(smokedfish)

# (3) plot of transformed data in log10[CFU/g]
#
Clog10 <- log10(smokedfish)
plotdistcens(Clog10)

# (4) Fit of a normal distribution to data in log10[CFU/g]
#
fitlog10 <- fitdistcens(Clog10,"norm")
summary(fitlog10)
plot(fitlog10)




