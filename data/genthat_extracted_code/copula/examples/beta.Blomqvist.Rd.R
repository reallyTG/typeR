library(copula)


### Name: beta.Blomqvist
### Title: Sample and Population Version of Blomqvist's Beta for
###   Archimedean Copulas
### Aliases: beta. betan beta.hat
### Keywords: multivariate distribution

### ** Examples

beta.(copGumbel, 2.5, d = 5)

d.set <- c(2:6, 8, 10, 15, 20, 30)
cols <- adjustcolor(colorRampPalette(c("red", "orange", "blue"),
                                     space = "Lab")(length(d.set)), 0.8)
## AMH:
for(i in seq_along(d.set))
   curve(Vectorize(beta.,"theta")(copAMH, x, d = d.set[i]), 0, .999999,
         main = "Blomqvist's beta(.) for  AMH",
         xlab = quote(theta), ylab = quote(beta(theta, AMH)),
         add = (i > 1), lwd=2, col=cols[i])
mtext("NB:  d=2 and d=3 are the same")
legend("topleft", paste("d =",d.set), bty="n", lwd=2, col=cols)

## Gumbel:
for(i in seq_along(d.set))
   curve(Vectorize(beta.,"theta")(copGumbel, x, d = d.set[i]), 1, 10,
         main = "Blomqvist's beta(.) for  Gumbel",
         xlab = quote(theta), ylab = quote(beta(theta, Gumbel)),
         add=(i > 1), lwd=2, col=cols[i])
legend("bottomright", paste("d =",d.set), bty="n", lwd=2, col=cols)

## Clayton:
for(i in seq_along(d.set))
   curve(Vectorize(beta.,"theta")(copClayton, x, d = d.set[i]), 1e-5, 10,
         main = "Blomqvist's beta(.) for  Clayton",
         xlab = quote(theta), ylab = quote(beta(theta, Gumbel)),
         add=(i > 1), lwd=2, col=cols[i])
legend("bottomright", paste("d =",d.set), bty="n", lwd=2, col=cols)

## Joe:
for(i in seq_along(d.set))
   curve(Vectorize(beta.,"theta")(copJoe, x, d = d.set[i]), 1, 10,
         main = "Blomqvist's beta(.) for  Joe",
         xlab = quote(theta), ylab = quote(beta(theta, Gumbel)),
         add=(i > 1), lwd=2, col=cols[i])
legend("bottomright", paste("d =",d.set), bty="n", lwd=2, col=cols)

## Frank:
for(i in seq_along(d.set))
   curve(Vectorize(beta.,"theta")(copFrank, x, d = d.set[i]), 1e-5, 50,
         main = "Blomqvist's beta(.) for  Frank",
         xlab = quote(theta), ylab = quote(beta(theta, Gumbel)),
         add=(i > 1), lwd=2, col=cols[i])
legend("bottomright", paste("d =",d.set), bty="n", lwd=2, col=cols)

## Shows the numeric problems:
curve(Vectorize(beta.,"theta")(copFrank, x, d = 29), 35, 42, col="violet")



