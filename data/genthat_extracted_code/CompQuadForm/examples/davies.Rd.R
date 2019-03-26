library(CompQuadForm)


### Name: davies
### Title: Davies method
### Aliases: davies
### Keywords: distribution htest

### ** Examples

# Some results from Table 3, p.327, Davies (1980)

 round(1 - davies(1, c(6, 3, 1), c(1, 1, 1))$Qq, 4)
 round(1 - davies(7, c(6, 3, 1), c(1, 1, 1))$Qq, 4)
 round(1 - davies(20, c(6, 3, 1), c(1, 1, 1))$Qq, 4)
 
 round(1 - davies(2, c(6, 3, 1), c(2, 2, 2))$Qq, 4)
 round(1 - davies(20, c(6, 3, 1), c(2, 2, 2))$Qq, 4)
 round(1 - davies(60, c(6, 3, 1), c(2, 2, 2))$Qq, 4)
 
 round(1 - davies(10, c(6, 3, 1), c(6, 4, 2))$Qq, 4)
 round(1 - davies(50, c(6, 3, 1), c(6, 4, 2))$Qq, 4)
 round(1 - davies(120, c(6, 3, 1), c(6, 4, 2))$Qq, 4)

 round(1 - davies(20, c(7, 3), c(6, 2), c(6, 2))$Qq, 4)
 round(1 - davies(100, c(7, 3), c(6, 2), c(6, 2))$Qq, 4)
 round(1 - davies(200, c(7, 3), c(6, 2), c(6, 2))$Qq, 4)

 round(1 - davies(10, c(7, 3), c(1, 1), c(6, 2))$Qq, 4)
 round(1 - davies(60, c(7, 3), c(1, 1), c(6, 2))$Qq, 4)
 round(1 - davies(150, c(7, 3), c(1, 1), c(6, 2))$Qq, 4)

 round(1 - davies(70, c(7, 3, 7, 3), c(6, 2, 1, 1), c(6, 2, 6, 2))$Qq, 4)
 round(1 - davies(160, c(7, 3, 7, 3), c(6, 2, 1, 1), c(6, 2, 6, 2))$Qq, 4)
 round(1 - davies(260, c(7, 3, 7, 3), c(6, 2, 1, 1), c(6, 2, 6, 2))$Qq, 4)

 round(1 - davies(-40, c(7, 3, -7, -3), c(6, 2, 1, 1), c(6, 2, 6,
 2))$Qq, 4)
 round(1 - davies(40, c(7, 3, -7, -3), c(6, 2, 1, 1), c(6, 2, 6, 2))$Qq,
 4)
 round(1 - davies(140, c(7, 3, -7, -3), c(6, 2, 1, 1), c(6, 2, 6,
 2))$Qq, 4)

# You should sometimes play with the 'lim' parameter:
davies(0.00001,lambda=0.2)
imhof(0.00001,lambda=0.2)$Qq
davies(0.00001,lambda=0.2, lim=20000)




