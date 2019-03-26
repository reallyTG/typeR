library(marelac)


### Name: gas_solubility
### Title: Solubility Parameters
### Aliases: gas_solubility
### Keywords: utilities

### ** Examples

gas_solubility(t = 1:20,S = 35, species = "CO2")
gas_solubility(t = 0:5,S = 35,species = "O2")

Temp <- seq(from = 0, to = 30, by = 0.1)
mf <- par(mfrow = c(1, 2))
gs  <- gas_solubility(t = Temp)
species   <- c("CCl4", "CO2", "N2O", "Rn", "CCl2F2")
matplot(Temp, gs[, species], type = "l", lty = 1, lwd = 2,
     xlab = "temperature", ylab = "mmol/m3", main = "solubility (S=35)")
legend("topright", col = 1:5, lwd = 2, legend = species)

species2 <- c("Kr", "CH4", "Ar", "O2", "N2", "Ne")
matplot(Temp, gs[, species2], type = "l", lty = 1, lwd = 2,
     xlab = "temperature", ylab = "mmol/m3", main = "solubility (S=35)")
legend("topright", col = 1:6, lwd = 2, legend = species2)




plot(Temp,gas_solubility(t = Temp, species = "CCl4"), xlab = "temperature",
     ylab = "mmol/m3/atm", main = "solubility (S=35)",
     type = "l", lwd = 2, ylim = c(0, 100000))
lines(Temp,gas_solubility(t = Temp, species = "CO2"), col = "red", lwd = 2)
lines(Temp,gas_solubility(t = Temp, species = "N2O"), col = "blue", lwd = 2)
lines(Temp,gas_solubility(t = Temp, species = "Rn"), col = "green", lwd = 2)
lines(Temp,gas_solubility(t = Temp, species = "CCl2F2"), col = "yellow", lwd = 2)

legend("topright", col = c("black", "red", "blue", "green", "yellow"), lwd = 2,
       legend = c("CCl4", "CO2", "N2O", "Rn", "CCl2F2"))

plot(Temp, gas_solubility(t = Temp, species = "Kr"), xlab = "temperature",
     ylab = "mmol/m3/atm", main = "solubility (S=35)", type = "l",
     lwd = 2, ylim = c(0, 4000))
lines(Temp, gas_solubility(t = Temp, species = "CH4"), col = "red", lwd = 2)
lines(Temp, gas_solubility(t = Temp, species = "Ar"), col = "blue", lwd = 2)
lines(Temp, gas_solubility(t = Temp, species = "O2"), col = "green", lwd = 2)
lines(Temp, gas_solubility(t = Temp, species = "N2"), col = "yellow", lwd = 2)
lines(Temp, gas_solubility(t = Temp, species = "Ne"), col = "grey", lwd = 2)

legend("topright",col = c("black", "red", "blue", "green", "yellow", "grey"),
       lwd = 2, legend = c("Kr", "CH4", "Ar", "O2", "N2", "Ne"))

par(mfrow = mf)

## generate table 3.2.3 from Sarmiento and Gruber
Temp <- seq (0,30,by = 5)

## saturated concentrations in mmol/m3 at at 1 atm;
# convert from /bar to /atm using 1.013253

A <- data.frame(cbind( t = Temp,
            He = gas_solubility(t = Temp,species = "He")*1.013253,
            Ne = gas_solubility(t = Temp,species = "Ne")*1.013253,
            N2 = gas_solubility(t = Temp,species = "N2")*1.013253,
            O2 = gas_solubility(t = Temp,species = "O2")*1.013253,
            Ar = gas_solubility(t = Temp,species = "Ar")*1.013253,
            Kr = gas_solubility(t = Temp,species = "Kr")*1.013253,
            Rn = gas_solubility(t = Temp,species = "Rn")*1.013253)  )
format(A,digits = 4)
## table values at
## 0   dgC:  349.4   448.6   818.8  1725  1879  3820  31150
## 20 dg C:  332.9   390.7   557.9  1126  1236  2241  14130
## note the (very) slight deviations for Rn

## saturated concentrations in micromol/m3 at 1 atm
AA <- data.frame(cbind( t = Temp,
            CH4    = gas_solubility(t = Temp,species = "CH4")   *1.013253,
            CO2    = gas_solubility(t = Temp,species = "CO2")   *1.013253,
            N2O    = gas_solubility(t = Temp,species = "N2O")   *1.013253,
            CCL2F2 = gas_solubility(t = Temp,species = "CCl2F2")*1.013253,
            CCL3F  = gas_solubility(t = Temp,species = "CCl3F") *1.013253,
            SF6    = gas_solubility(t = Temp,species = "SF6")   *1.013253,
            CCl4   = gas_solubility(t = Temp,species = "CCl4")  *1.013253))
format(AA,digits = 4)

## Table values at
##  0 dgC: 1984  64400 47840  6686 27380   425.2  97114
## 20 dgC: 1241  33110 23870  2566  9242   195.8  30307
## Note: there are slight deviations for CO2, and N2O!



