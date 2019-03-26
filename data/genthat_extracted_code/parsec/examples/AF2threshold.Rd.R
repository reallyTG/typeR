library(parsec)


### Name: AF2threshold
### Title: Poset threshold making the poset approach equivalent to the AF
###   counting approach
### Aliases: AF2threshold

### ** Examples

vl <- c(2, 3, 2)
prof <- var2prof(varlen = vl, labtype = "progressive")

res <- AF(prof, z = c(1, 2, 1), k = 1)

thr <- AF2threshold(res, prof)

plot(prof, col = 1 + thr, lwd = 1 + res$c,
     main = "Comparison between OPHI and parsec",
     sub = "bold: deprived profiles identified by OPHI, red: parsec threshold")

eval <- evaluation(prof, thr, maxint = 10^4, nit = 10^7)

ord <- order(eval$idn_f, res$c)
plot(eval$idn_f[ord], col = "red", lwd=2, type = "l", xlab="",
     ylab = "", axes = FALSE, frame.plot = TRUE,
     main = "Comparison between OPHI and parsec",
     sub = "red: identification function, black: OPHI deprived profiles")
points(res$c[ord], type="l", lwd=2)
axis(2)



