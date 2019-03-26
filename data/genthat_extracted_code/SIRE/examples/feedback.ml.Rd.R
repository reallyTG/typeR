library(SIRE)


### Name: feedback.ml
### Title: Testing for Feedback Effects in a Simultaneous Equation Model
### Aliases: feedback.ml

### ** Examples

## No test: 
data("macroIT")
eq.system = list(
              eq1 = C ~  CP  + I + CP_1,
              eq2 = I ~ K + CP_1,
              eq3 = WP ~ I + GDP + GDP_1,
              eq4 = GDP ~ C + I + GDP_1,
              eq5 = CP ~ WP + T,
              eq6 = K ~ I + K_1)

instruments = ~ T + CP_1 + GDP_1 + K_1

c.dec = causal.decompose(data = macroIT,
                         eq.system = eq.system,
                         resid.est = "noDfCor",
                         instruments = instruments,
                         p.adj = TRUE,
                         alpha = 0.05)

feedback.ml(data = macroIT,
              out.decompose = c.dec,
              eq.id = 2,
              seed.in = 10,
              n.init = 50,
              range.init = c(-1,1),
              info = TRUE,
              maxit = 1000,
              perc.print = 0)
              
## End(No test)




