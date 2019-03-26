library(CompQuadForm)


### Name: imhof
### Title: Imhof method.
### Aliases: imhof
### Keywords: distribution htest

### ** Examples

# Some results from Table 1, p.424, Imhof (1961)

# Q1 with x = 2
round(imhof(2, c(0.6, 0.3, 0.1))$Qq, 4)

# Q2 with x = 6
round(imhof(6, c(0.6, 0.3, 0.1), c(2, 2, 2))$Qq, 4)

# Q6 with x = 15
round(imhof(15, c(0.7, 0.3), c(1, 1), c(6, 2))$Qq, 4)




