library(plm)


### Name: pbsytest
### Title: Bera, Sosa-Escudero and Yoon Locally-Robust Lagrange Multiplier
###   Tests for Panel Models and Joint Test by Baltagi and Li
### Aliases: pbsytest pbsytest.formula pbsytest.panelmodel
### Keywords: htest

### ** Examples

## Bera et al. (2001), p. 13, table 1 use a subset of the original Grunfeld
## data which contains three errors -> construct this subset:
data("Grunfeld", package = "plm")
Grunsubset <- rbind(Grunfeld[1:80, ], Grunfeld[141:160, ])
Grunsubset[Grunsubset$firm == 2 & Grunsubset$year %in% c(1940, 1952), ][["inv"]] <- c(261.6, 645.2)
Grunsubset[Grunsubset$firm == 2 & Grunsubset$year == 1946, ][["capital"]] <- 232.6

## default is AR testing (formula interface)
pbsytest(inv ~ value + capital, data = Grunsubset, index = c("firm", "year"))
pbsytest(inv ~ value + capital, data = Grunsubset, index = c("firm", "year"), test = "re")
pbsytest(inv ~ value + capital, data = Grunsubset, index = c("firm", "year"), 
  test = "re", re.normal = FALSE)
pbsytest(inv ~ value + capital, data = Grunsubset, index = c("firm", "year"), test = "j")

## plm interface
mod <- plm(inv ~ value + capital, data = Grunsubset, model = "pooling")
pbsytest(mod)



