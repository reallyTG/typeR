library(mpt)


### Name: plot.mpt
### Title: Diagnostic Plot for MPT Models
### Aliases: plot.mpt residuals.mpt
### Keywords: models

### ** Examples

## Compare two constrained MPT models
data(proact)

spec <- mptspec(
  p1*q1*r1,
  p1*q1*(1 - r1),
  p1*(1 - q1)*r1,
  (1 - p1) + p1*(1 - q1)*(1 - r1),

  p2*q2*r2,
  p2*q2*(1 - r2),
  p2*(1 - q2)*r2,
  (1 - p2) + p2*(1 - q2)*(1 - r2),

  p3*q3*r3,
  p3*q3*(1 - r3),
  p3*(1 - q3)*r3,
  (1 - p3) + p3*(1 - q3)*(1 - r3)
)
mpt1 <- mpt(update(spec, .restr = list(p2 = p1, p3 = p1)),
            proact[proact$test == 1, ])
mpt2 <- mpt(update(spec, .restr = list(q2 = q1, q3 = q1)),
            proact[proact$test == 1, ])

par(mfrow = c(1, 2))                   # residuals versus fitted values
plot(mpt1, main = "p constrained", ylim = c(-3, 3.5))  # good fit
plot(mpt2, main = "q constrained", ylim = c(-3, 3.5))  # bad fit

sum( resid(mpt1)^2 )                   # likelihood ratio G2
sum( resid(mpt1, "pearson")^2 )        # Pearson X2



