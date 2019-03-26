library(diffEq)


### Name: stability.multistep
### Title: Plots the stability function of multistep methods
### Aliases: stability.multistep stability.bruteforce
### Keywords: math

### ** Examples

par(mfrow=c(2,2))

## =============================================================================
## Stability regions for multistep methods
## =============================================================================

# Adams-Bashforth
stability.multistep(alpha = AdamsBashforth$alpha[2,], beta = AdamsBashforth$beta[2,], 
             xlim = c(-3,1), ylim = c(-1.5, 1.5),
             fill = "black",  main = "Adams-Bashforth")

stability.multistep(alpha = AdamsBashforth$alpha[3,], beta = AdamsBashforth$beta[3,], 
             add = TRUE, lty = 1, fill = "darkgrey")

stability.multistep(alpha = AdamsBashforth$alpha[4,], beta = AdamsBashforth$beta[4,],
             add = TRUE, fill = "lightgrey", lty = 1)

stability.multistep(alpha = AdamsBashforth$alpha[5,], beta = AdamsBashforth$beta[5,],
             add = TRUE, fill = "white", lty = 1)

legend("topleft", fill = c("black", "darkgrey", "lightgrey", "white"),
       title = "order", legend = 2:5)
writelabel("A")


# Adams-Moulton
stability.multistep(alpha = AdamsMoulton$alph[3,], beta = AdamsMoulton$beta[3,], 
             xlim = c(-8, 1), ylim = c(-4, 4), 
             fill = "black",   main = "Adams-Moulton")
stability.multistep(alpha = AdamsMoulton$alpha[4,], beta = AdamsMoulton$beta[4,], 
             add = TRUE, fill = "darkgrey")
stability.multistep(alpha = AdamsMoulton$alpha[5,], beta = AdamsMoulton$beta[5,], 
             add = TRUE, fill = "lightgrey")

legend("topleft", fill = c("black", "darkgrey", "lightgrey"),
       title = "order", legend = 3:5 )
writelabel("B")

# 2nd-order BDF
plot(0, type="n", xlim = c(-3, 12), ylim = c(-8, 8),
     main = "BDF order 2", 
     xlab = "Re(z)", ylab = "Im(z)")
rect(-100, -100, 100, 100, col = "lightgrey")
box()

stability.multistep (alpha = BDF$alpha[2,], beta = BDF$beta[2,], 
        fill = "white", add = TRUE)

writelabel("C")

# 4th-order BDF
plot(0, type="n", xlim=c(-3, 12), ylim = c(-8, 8),
     main = "BDF order 4", 
     xlab = "Re(z)", ylab = "Im(z)")
rect(-100, -100, 100, 100, col = "lightgrey")
box()
stability.multistep (alpha = BDF$alpha[4,], beta = BDF$beta[4,], 
        fill = "white", add = TRUE)

writelabel("D")

## =============================================================================
## Stability regions for runge-kutta methods
## =============================================================================
# Drawing the stability regions  - brute force
# stability function for explicit runge-kutta's
rkstabfunc <- function (z, order = 1) {
   h <- 1
   ss <- 1
   for (p in 1: order) ss <- ss + (h*z)^p / factorial(p)
   return (abs(ss) <= 1) 
 }

# regions for stability orders 5 to 1 - rather crude
Rez <- seq(-5, 1, by = 0.1)
Imz <- seq(-3, 3, by = 0.1) 

stability.bruteforce(main = "Explicit RK", 
   func = function(z) rkstabfunc(z, order = 5),
   Rez = Rez, Imz = Imz, fill = grey(0.95)  )

stability.bruteforce(add = TRUE, 
   func = function(z) rkstabfunc(z, order = 4),
   Rez = Rez, Imz = Imz, fill = grey(0.75)  )

stability.bruteforce(add = TRUE, 
   func = function(z) rkstabfunc(z, order = 3),
   Rez = Rez, Imz = Imz, fill = grey(0.55)  )

stability.bruteforce(add = TRUE, 
   func = function(z) rkstabfunc(z, order = 2),
   Rez = Rez, Imz = Imz, fill = grey(0.35)  )

stability.bruteforce(add = TRUE, 
   func = function(z) rkstabfunc(z, order = 1),
   Rez = Rez, Imz = Imz, fill = grey(0.15)  )

legend("topleft", legend = 5:1, title = "order", 
  fill = grey(c(0.95, 0.75, 0.55, 0.35, 0.15)))
  
# stability function for radau method

stability.bruteforce(main = "Radau 5", 
   Rez = seq(-5,15,by=0.1), Imz = seq(-10,10,by=0.12),
   func = function(z) return(abs((1 + 2*z/5 + z^2/20) /
                                 (1 - 3*z/5 + 3*z^2/20 - z^3/60)) <= 1),
   col = grey(0.8)  )




