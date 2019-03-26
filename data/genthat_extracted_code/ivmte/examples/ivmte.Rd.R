library(ivmte)


### Name: ivmte
### Title: Estimation procedure from Mogstad, Torgovitsky (2017)
### Aliases: ivmte

### ** Examples

ivlikespecs <- c(ey ~ d | z,
                 ey ~ d | factor(z),
                 ey ~ d,
                 ey ~ d | factor(z))
jvec <- l(d, d, d, d)
svec <- l(, , , z %in% c(2, 4))

ivmte(ivlike = ivlikespecs,
      data = dtm,
      components = jvec,
      propensity = d ~ z,
      subset = svec,
      m0 = ~  u + I(u ^ 2),
      m1 = ~  u + I(u ^ 2),
      uname = u,
      target = "att",
      m0.dec = TRUE,
      m1.dec = TRUE,
      bootstraps = 0,
      lpsolver = "lpSolveAPI")




