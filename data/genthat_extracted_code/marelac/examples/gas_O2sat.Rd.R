library(marelac)


### Name: gas_O2sat
### Title: Saturation Concentration of Oxygen in Water
### Aliases: gas_O2sat
### Keywords: misc

### ** Examples

gas_O2sat(S = 0, t = 20)                  # fresh water, Weiss formula
gas_O2sat(S = 0, t = 20, method = "APHA") # fresh water, APHA formula

## compare this with
gas_satconc(S = 0, t = 20, species = "O2") * molweight("O2") / 1000

T <- seq(0, 30, 0.1)
plot(T, gas_O2sat(S = 0, t = T, method = "APHA"),
  ylab="O2 sat (mg/L)", type = "l", ylim = c(0, 15))
lines(T, gas_O2sat(S = 0, t = T, method = "Weiss"),
  col = "blue", lwd = 2, lty = "dashed")
lines(T, gas_O2sat(S = 5, t = T, method = "Weiss"), col = "green")
lines(T, gas_O2sat(S = 10, t = T, method = "Weiss"), col = "yellow")
lines(T, gas_O2sat(S = 20, t = T, method = "Weiss"), col = "orange")
lines(T, gas_O2sat(S = 35, t = T, method = "Weiss"), col = "red")

legend("bottomleft", 
  col = c("black", "white", "blue", "green", "yellow", "orange", "red"),
  lty = c(1, 0, 2, 1, 1, 1, 1), lwd = c(1,0 ,2, 1, 1, 1, 1),
  legend=c("freshwater formula", "marine formula:", 
          "S = 0", "S = 5", "S = 10", "S = 20", "S = 35"))



