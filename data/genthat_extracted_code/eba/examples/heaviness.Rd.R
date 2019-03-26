library(eba)


### Name: heaviness
### Title: Weights Judging Data
### Aliases: heaviness
### Keywords: datasets

### ** Examples

data(heaviness)
## 6 subjects chose 90g over 100g, when 90g was presented first.
heaviness["90g", "100g", order=1]

## 44 subjects chose 100g over 90g, when 90g was presented first.
heaviness["100g", "90g", order=1]

## 14 subjects chose 90g over 100g, when 90g was presented second.
heaviness["90g", "100g", order=2]

## 36 subjects chose 100g over 90g, when 90g was presented second.
heaviness["100g", "90g", order=2]

## Bradley-Terry-Luce (BTL) model for each within-pair order
btl1 <- eba(heaviness[, , 1])
btl2 <- eba(heaviness[, , 2])

xval <- seq(90, 110, 5)
plot(uscale(btl1) ~ xval, type="n", log="y",
     xlab="Mass of lead shot filled bottle (in g)",
     ylab="Perceived heaviness (BTL model)",
     main="Weights judging experiment")
mtext("(Beaver and Gokhale, 1975)", line=.5)

arrows(xval, uscale(btl1) - 1.96*sqrt(diag(cov.u(btl1))),
       xval, uscale(btl1) + 1.96*sqrt(diag(cov.u(btl1))), .05, 90, 3, "gray")
arrows(xval, uscale(btl2) - 1.96*sqrt(diag(cov.u(btl2))),
       xval, uscale(btl2) + 1.96*sqrt(diag(cov.u(btl2))), .05, 90, 3, "gray")

points(uscale(btl1) ~ xval, type="b", pch=16)
points(uscale(btl2) ~ xval, type="b", lty=2, pch=21, bg="white")

text(90.3, .01,  "Lower weight judged first", adj=0)
text(90.3, .08, "Higher weight judged first", adj=0)



