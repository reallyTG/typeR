library(miscor)


### Name: print.size
### Title: Print size
### Aliases: print.size

### ** Examples

#--------------------------------------
# H0: rho = 0.3, H1: rho != 0.3
# alpha = 0.05, beta = 0.2, delta = 0.2

n <- size.cor(delta = 0.2, rho = 0.3, alpha = 0.05, beta = 0.2,
              output = FALSE)

print(n)



