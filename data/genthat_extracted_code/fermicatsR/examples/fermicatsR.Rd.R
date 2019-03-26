library(fermicatsR)


### Name: fermicatsR
### Title: fermicatsR (v 1.4): A package containing catalogs from the Fermi
###   Large Area Telescope.
### Aliases: fermicatsR fermicatsR-package

### ** Examples

# Variability index vs Curvature significance of 2FGL sources, color-coded by source class
data(FGL2)
if (require("ggplot2")) {
qplot(log(Signif_Curve), log(Variability_Index), data = FGL2, color = CLASS1)
}
# Distribution of spindown luminosities of LAT-detected gamma-ray pulsars
data(pulsars)
hist(log10(pulsars$Edot), 
xlab = "Log(Spindown Luminosity) (erg/s)", 
ylab = "Number of pulsars", 
main = "LAT-Detected Gamma-ray Pulsars")



