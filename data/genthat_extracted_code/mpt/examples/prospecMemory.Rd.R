library(mpt)


### Name: prospecMemory
### Title: Prospective Memory by Instruction Type
### Aliases: prospecMemory
### Keywords: datasets

### ** Examples

## Prospective memory model: identifiability
qr(mptspec("prospec",
   .restr=list(M1=M, M2=M))$par2deriv(runif(6))$deriv)$rank
qr(mptspec("prospec",
   .restr=list(M1=M, M2=M, g=.1, c=.5))$par2deriv(runif(4))$deriv)$rank

## Prospective memory model: goodness of fit
data(prospecMemory)
cmi <- prospecMemory[prospecMemory$instruction == "cmi", ]
m2 <- mpt(mptspec("prospec", .restr=list(M1=M, M2=M, g=.1, c=.5)), cmi)
m1 <- mpt(update(m2$spec, .restr=list(C2=C1)), cmi)
anova(m1, m2)

pmi <- prospecMemory[prospecMemory$instruction == "pmi", ]
anova(mpt(m1$spec, pmi), mpt(m2$spec, pmi))

## Testing P_cmi = P_pmi and M_cmi = M_pmi
m2 <- mpt(mptspec("prospec", .replicates=2,
                  .restr=list(M11=M1, M21=M1, g1=.1, c1=.5,
                              M12=M2, M22=M2, g2=.1, c2=.5)),
          data=prospecMemory)
m1 <- mpt(update(m2$spec, .restr=list(P2=P1)), prospecMemory)
m0 <- mpt(update(m2$spec, .restr=list(M2=M1)), prospecMemory)
anova(m1, m2)
anova(m0, m2)

dotchart(coef(m2)[c("C12", "C22", "P2", "M2")], xlim=c(0, 1),
  labels=c("C1", "C2", "P", "M"), main="Smith and Bayen (2004, Exp. 1)",
  xlab="Parameter estimate (Prospective memory model)")
points(coef(m2)[c("C11", "C21", "P1", "M1")], 1:4, pch=16)
legend("bottomleft", c("CMI", "PMI"), pch=c(1, 16), title="Instruction",
       title.adj=1, bty="n")



