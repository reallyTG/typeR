library(spatstat)


### Name: Pairwise
### Title: Generic Pairwise Interaction model
### Aliases: Pairwise
### Keywords: spatial models

### ** Examples

   #This is the same as StraussHard(r=0.7,h=0.05)
   strpot <- function(d,par) {
         r <- par$r
         h <- par$h
         value <- (d <= r)
         value[d < h] <- -Inf
         value
   }
   mySH <- Pairwise(strpot, "StraussHard process", list(r=0.7,h=0.05),
           c("interaction distance r", "hard core distance h"))
   data(cells)
   ppm(cells, ~ 1, mySH, correction="isotropic")

   # Fiksel (1984) double exponential interaction
   # see Stoyan, Kendall, Mecke 1987 p 161

   fikspot <- function(d, par) {
      r <- par$r
      h <- par$h
      zeta <- par$zeta
      value <- exp(-zeta * d)
      value[d < h] <- -Inf
      value[d > r] <- 0
      value
   }
   Fiksel <- Pairwise(fikspot, "Fiksel double exponential process",
                      list(r=3.5, h=1, zeta=1),
                      c("interaction distance r",
                        "hard core distance h",
                        "exponential coefficient zeta"))
   data(spruces)
   fit <- ppm(unmark(spruces), ~1, Fiksel, rbord=3.5)
   fit
   plot(fitin(fit), xlim=c(0,4))
   coef(fit)
   # corresponding values obtained by Fiksel (1984) were -1.9 and -6.0



