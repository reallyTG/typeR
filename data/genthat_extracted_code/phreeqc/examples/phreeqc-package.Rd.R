library(phreeqc)


### Name: phreeqc-package
### Title: R interface to the PHREEQC geochemical modeling program.
### Aliases: phreeqc-package phreeqc
### Keywords: package

### ** Examples


#########################################################################
# Run ex2 and plot results
#########################################################################

# load the phreeqc.dat database
phrLoadDatabaseString(phreeqc.dat)

# run example 2
phrRunString(ex2)

# retrieve selected_output as a list of data.frame
so <- phrGetSelectedOutput()

# plot the results
attach(so$n1)
title  <- "Gypsum-Anhydrite Stability"
xlabel <- "Temperature, in degrees celcius"
ylabel <- "Saturation index"
plot(temp.C., si_gypsum, main = title, xlab = xlabel, ylab = ylabel,
     col = "darkred", xlim = c(25, 75), ylim = c(-0.4, 0.0))
points(temp.C., si_anhydrite, col = "darkgreen")
legend("bottomright", c("Gypsum", "Anhydrite"),
       col = c("darkred", "darkgreen"), pch = c(1, 1))



