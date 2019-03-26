library(strucchange)


### Name: sctest.default
### Title: Structural Change Tests in Parametric Models
### Aliases: sctest.default
### Keywords: htest

### ** Examples

## Zeileis and Hornik (2007), Section 5.3, Figure 6
data("Grossarl")
m <- glm(cbind(illegitimate, legitimate) ~ 1, family = binomial, data = Grossarl,
  subset = time(fraction) <= 1800)
sctest(m, order.by = 1700:1800, functional = "CvM")



