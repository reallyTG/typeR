library(mpt)


### Name: retroact
### Title: Recall Frequencies for a Retroactive Inhibition Experiment
### Aliases: retroact
### Keywords: datasets

### ** Examples

data(retroact)

## Fitting individual storage-retrieval models per condition
spec <- mptspec(
  c*r,
  (1 - c)*u^2,
  2*(1 - c)*u*(1 - u),
  c*(1 - r) + (1 - c)*(1 - u)^2,
  u,
  1 - u
)
pars <- sapply(0:4,
  function(x) coef(mpt(spec, retroact[retroact$lists == x,])))

## Figure 3 in Riefer & Batchelder (1988)
plot(pars["c",] ~ I(0:4), pch=16, type="b", ylim=c(.3, 1),
     xlab="Number of interpolated lists, j",
     ylab="Parameter estimate (Storage-retrieval model)",
     main="Riefer and Batchelder (1988)")
points(pars["r",] ~ I(0:4), type="b", lty=2)
text(3, .89, expression("Storage of clusters," ~ hat(c)[j]))
text(3, .46, expression("Retrieval of clusters," ~ hat(r)[j]))

## Testing hypotheses about the parameters
mpt1 <- mpt(mptspec(
  c0*r0,
  (1 - c0)*u0^2,
  2*(1 - c0)*u0*(1 - u0),
  c0*(1 - r0) + (1 - c0)*(1 - u0)^2,
  u0,
  1 - u0,

  c1*r1,
  (1 - c1)*u1^2,
  2*(1 - c1)*u1*(1 - u1),
  c1*(1 - r1) + (1 - c1)*(1 - u1)^2,
  u1,
  1 - u1,

  c2*r2,
  (1 - c2)*u2^2,
  2*(1 - c2)*u2*(1 - u2),
  c2*(1 - r2) + (1 - c2)*(1 - u2)^2,
  u2,
  1 - u2,

  c3*r3,
  (1 - c3)*u3^2,
  2*(1 - c3)*u3*(1 - u3),
  c3*(1 - r3) + (1 - c3)*(1 - u3)^2,
  u3,
  1 - u3,

  c4*r4,
  (1 - c4)*u4^2,
  2*(1 - c4)*u4*(1 - u4),
  c4*(1 - r4) + (1 - c4)*(1 - u4)^2,
  u4,
  1 - u4
), retroact)

mpt2 <- mpt(update(mpt1$spec, .restr=list(r0=r, r1=r, r2=r, r3=r, r4=r)),
            retroact)
mpt3 <- mpt(update(mpt1$spec, .restr=list(c0=c, c1=c, c2=c, c3=c, c4=c)),
            retroact)

anova(mpt2, mpt1)  # r decreases the more lists have been interpolated
anova(mpt3, mpt1)  # c remains constant



