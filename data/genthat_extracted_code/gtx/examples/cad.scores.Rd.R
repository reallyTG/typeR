library(gtx)


### Name: cad.scores
### Title: Genetic risk scores for coronary artery disease risk
### Aliases: cad.scores
### Keywords: datasets

### ** Examples

data(cad.scores)
cad.scores$MAF <- pmin(cad.scores$coded.freq, 1-cad.scores$coded.freq)
cad.scores$OR <- exp(abs(cad.scores$coef))
plot(cad.scores$MAF, cad.scores$OR,
     xlim = c(0, 0.5), ylim = c(1, max(cad.scores$OR)),
     xlab = "Minor allele frequency",
     ylab = "Odds ratio effect", las = 1)
text(cad.scores$MAF, cad.scores$OR, cad.scores$name, pos = 1, cex = 0.5)



