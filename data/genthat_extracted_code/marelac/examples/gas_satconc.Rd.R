library(marelac)


### Name: gas_satconc
### Title: Saturated Concentrations of Gases in Water
### Aliases: gas_satconc
### Keywords: utilities

### ** Examples

gas_satconc(species = "O2")
Temp <- seq(from = 0, to = 30, by = 0.1)
Sal  <- seq(from = 0, to = 35, by = 0.1)

mf  <- par(mfrow = c(1,2))

species <- c("N2", "CO2", "O2", "CH4", "N2O")
gsat  <- gas_satconc(t = Temp, species = species)

matplot(Temp, gsat, type = "l", xlab = "temperature", log = "y", lty = 1,
     ylab = "mmol/m3", main = "Saturated conc (S=35)", lwd = 2)
legend("right", col = 1:5, lwd = 2, legend = species)

gsat  <- gas_satconc(S = Sal, species = species)
matplot(Sal, gsat, type = "l", xlab = "salinity", log = "y", lty = 1,
     ylab = "mmol/m3", main = "Saturated conc (T=20)", lwd = 2)
legend("right", col = 1:5, lwd = 2, legend = species)


par(mfrow = mf)

## generate table 3.2.4 from Sarmiento and Gruber
Temp <- seq (0, 30, by = 5)
## saturated concentrations in mmol/m3, at 1 atm.
A <- data.frame(cbind( t = Temp,
            N2  = gas_satconc(t = Temp, species = "N2"),
            O2  = gas_satconc(t = Temp, species = "O2"),
            CO2 = gas_satconc(t = Temp, species = "CO2"),
            Ar  = gas_satconc(t = Temp, species = "Ar")))
format(A, digits = 4)
## table values
## at  0 dg C: 635.6   359.1  23.37  17.44
## at 20 dg C: 425.7   230.5  11.61  11.29
## note the deviations for CO2 (20dg)!

## saturated concentrations in micromol/m3, at 1 atm.
AA <- data.frame(cbind(t = Temp,
            N2O = gas_satconc(t = Temp, species = "N2O")*1000,
            Ne  = gas_satconc(t = Temp, species = "Ne" )*1000,
            Kr  = gas_satconc(t = Temp, species = "Kr" )*1000,
            CH4 = gas_satconc(t = Temp, species = "CH4")*1000,
            He  = gas_satconc(t = Temp, species = "He" )*1000))
format(AA, digits = 4)
## table values
## at  0 dgC: 14.84 8.11  4.33  3.44  1.81
## at 20 dgC: 7.16  6.94  2.50  2.12  1.70
## Note: different for N2O



