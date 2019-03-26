library(lme4)


### Name: expandDoubleVerts
### Title: Expand terms with "||" notation into separate "|" terms
### Aliases: expandDoubleVerts ||
### Keywords: models utilities

### ** Examples

  m <- ~ x + (x || g)
  expandDoubleVerts(m)
  set.seed(101)
  dd <- expand.grid(f=factor(letters[1:3]),g=factor(1:200),rep=1:3)
  dd$y <- simulate(~f + (1|g) + (0+dummy(f,"b")|g) + (0+dummy(f,"c")|g),
          newdata=dd,
          newparams=list(beta=rep(0,3),
                         theta=c(1,2,1),
                         sigma=1),
          family=gaussian)[[1]]
  m1 <- lmer(y~f+(f|g),data=dd)
  VarCorr(m1)
  m2 <- lmer(y~f+(1|g) + (0+dummy(f,"b")|g) + (0+dummy(f,"c")|g),
               data=dd)
  VarCorr(m2)



