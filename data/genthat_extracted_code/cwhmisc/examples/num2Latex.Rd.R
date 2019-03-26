library(cwhmisc)


### Name: num2Latex
### Title: Convert numeric containing e+-power
### Aliases: num2Latex
### Keywords: print

### ** Examples

 z <- c(1.5, 5e-12, 2.33e-03, 8.12e+10, 2)
 num2Latex(z)     #  1.5,  5 \cdot 10^{-12},  0.00233,  8.12 \cdot 10^{10},  2
 num2Latex(z, 2)  #  1.5,  5 \cdot 10^{-12},  2.33 \cdot 10^{-3},  8.12 \cdot 10^{10},  2 
 num2Latex(z, -3) #  1.5,  5 \cdot 10^{-12},  0.00233, 81200000000, 2 



