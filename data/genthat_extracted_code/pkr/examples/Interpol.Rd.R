library(pkr)


### Name: Interpol
### Title: Interpolate y value
### Aliases: Interpol
### Keywords: interpolation interval AUC partial AUC

### ** Examples

x = 10:1 + 0.1
y = -2*x + 40.2
Interpol(x, y, 1.5)
Interpol(x, y, 1.5, down="Log")



