library(mpt)


### Name: proact
### Title: Recall Frequencies for DaPolito's Experiment on Proactive
###   Inhibition
### Aliases: proact
### Keywords: datasets

### ** Examples

data(proact)

## Testing hypotheses about the parameters
mpt1 <- mpt(mptspec(
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
  (1 - p3) + p3*(1 - q3)*(1 - r3),

  p4*q4*r4,
  p4*q4*(1 - r4),
  p4*(1 - q4)*r4,
  (1 - p4) + p4*(1 - q4)*(1 - r4),

  p5*q5*r5,
  p5*q5*(1 - r5),
  p5*(1 - q5)*r5,
  (1 - p5) + p5*(1 - q5)*(1 - r5),

  p6*q6*r6,
  p6*q6*(1 - r6),
  p6*(1 - q6)*r6,
  (1 - p6) + p6*(1 - q6)*(1 - r6)
), proact)

mpt2 <- mpt(update(mpt1$spec, .restr=list(q2=q1, q3=q1, q4=q2, q5=q2, q6=q2)),
            proact)
mpt3 <- mpt(update(mpt1$spec, .restr=list(r2=r1, r3=r1, r4=r2, r5=r2, r6=r2)),
            proact)

anova(mpt2, mpt1)  # q increases with number of A-B presentations
anova(mpt3, mpt1)  # r remains constant



