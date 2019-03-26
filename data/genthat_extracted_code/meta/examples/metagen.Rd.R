library(meta)


### Name: metagen
### Title: Generic inverse variance meta-analysis
### Aliases: metagen
### Keywords: htest

### ** Examples

data(Fleiss93)
meta1 <- metabin(event.e, n.e, event.c, n.c, data=Fleiss93, sm="RR", method="I")
meta1

#
# Identical results by using the following commands:
#
meta1
metagen(meta1$TE, meta1$seTE, sm="RR")

forest(metagen(meta1$TE, meta1$seTE, sm="RR"))


#
# Meta-analysis with prespecified between-study variance
#
summary(metagen(meta1$TE, meta1$seTE, sm="RR", tau.preset=sqrt(0.1)))


#
# Meta-analysis of survival data:
#
logHR <- log(c(0.95, 1.5))
selogHR <- c(0.25, 0.35)

metagen(logHR, selogHR, sm="HR")


#
# Paule-Mandel method to estimate between-study variance
# Data from Paule & Mandel (1982)
#
average <- c(27.044, 26.022, 26.340, 26.787, 26.796)
variance <- c(0.003, 0.076, 0.464, 0.003, 0.014)
#
summary(metagen(average, sqrt(variance), sm="MD", method.tau="PM"))



