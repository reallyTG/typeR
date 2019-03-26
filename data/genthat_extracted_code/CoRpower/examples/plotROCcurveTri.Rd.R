library(CoRpower)


### Name: plotROCcurveTri
### Title: Plotting of ROC Curves for Trichotomous Biomarkers
### Aliases: plotROCcurveTri

### ** Examples

Plat0 <- 0.2
Plat2 <- c(0.2, 0.3, 0.4, 0.5)
P0 <- seq(0.90, 0.10, len=10)
P2 <- seq(0.10, 0.90, len=10)
rho <- c(1, 0.9, 0.7, 0.5)
plotROCcurveTri(Plat0 = Plat0, Plat2 = Plat2, P0 = P0, P2 = P2, rho = rho)




