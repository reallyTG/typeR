library(TukeyC)


### Name: summary
### Title: Summary Method for TukeyC and TukeyC.nest Objects
### Aliases: summary.TukeyC
### Keywords: package

### ** Examples

  ##
  ## Examples: Completely Randomized Design (CRD)
  ## More details: demo(package='TukeyC')
  ##
  
  ## The parameters can be: formula, aov, lm and aovlist
  data(CRD2)
  
  ## From: formula
  tk1 <- with(CRD2,
              TukeyC(y ~ x,
                     data=dfm,
                     which='x',
                     id.trim=5))
  summary(tk1)

  ##
  ## Example: Randomized Complete Block Design (RCBD)
  ## More details: demo(package='TukeyC')
  ##
  
  ## The parameters can be: formula, aov, lm and aovlist 
  data(RCBD)
  
  ## From: formula
  tk2 <- with(RCBD,
              TukeyC(y ~ blk + tra,
                     data=dfm,
                     which='tra'))
  summary(tk2)

  ##
  ## Example: Latin Squares Design (LSD)
  ## More details: demo(package='TukeyC')
  ##
  
  ## The parameters can be: design matrix and the response variable,
  ## data.frame or aov
       
  data(LSD)
  
  ## From: formula
  tk3 <- with(LSD,
              TukeyC(y ~ rows + cols + tra,
                     data=dfm,
                     which='tra'))
  summary(tk3)

  ##
  ## Example: Factorial Experiment (FE)
  ## More details: demo(package='TukeyC')
  ##
  
  ## The parameters can be: design matrix and the response variable,
  ## data.frame or aov
  
  data(FE)
  ## From: design matrix (dm) and response variable (y)
  ## Main factor: N
  tk4 <- with(FE,
              TukeyC(y ~ blk + N*P*K,
                     data=dfm,
                     which='N'))
  summary(tk4)

  ## Nested: p1/N
  ## Testing N inside of level one of P
  ntk1 <- with(FE,
               TukeyC(y ~ blk + N*P*K,
                      data=dfm,
                      which='P:N',
                      fl1=1))
  summary(ntk1)

  ## Nested: k1/p1/N
  ## Testing N inside of level one of K and level one of P
  ntk2 <- with(FE,
               TukeyC(y ~ blk + N*P*K,
                      data=dfm,
                      which='K:P:N',
                      fl1=1,
                      fl2=1))
  summary(ntk2)

  ## Nested: k2/n2/P
  ntk3 <- with(FE,
               TukeyC(y ~ blk + N*P*K,
                      data=dfm,
                      which='K:N:P',
                      fl1=2,
                      fl2=2))
  summary(ntk3)

  ## Nested: p1/n1/K
  ntk4 <- with(FE,
               TukeyC(y ~ blk + N*P*K,
                      data=dfm,
                      which='P:N:K',
                      fl1=1,
                      fl2=1))
  summary(ntk4)

  ##
  ## Example: Split-plot Experiment (SPE)
  ## More details: demo(package='TukeyC')
  ##
  
  data(SPE)
  ## From: formula
  ## Main factor: P
  ## It is necessary to inform the appropriate error for the test
  tk1 <- with(SPE,
              TukeyC(y ~ blk + P*SP + Error(blk/P),
                     data=dfm,
                     which='P',
                     error='blk:P'))
  summary(tk1)

  ## Nested: p1/SP
  tkn1 <- with(SPE,
               TukeyC(y ~ blk + P*SP + Error(blk/P),
                      data=dfm,
                      which='P:SP',
                      fl1=1 ))
  summary(tkn1)

  ## From: formula
  ## Main factor: P
  ## It is necessary to inform the appropriate error for the test
  data(SSPE) 

  tk1 <- with(SSPE,
              TukeyC(y ~ blk + P*SP*SSP + Error(blk/P/SP),
                     data=dfm,
                     which='P',
                     error='blk:P'))
  summary(tk1)

  ## Main factor: SP
  ## It is necessary to inform the appropriate error for the test
  tk2 <- with(SSPE,
              TukeyC(y ~ blk + P*SP*SSP + Error(blk/P/SP),
                     data=dfm,
                     which='SP',
                     error='blk:P:SP'))
  summary(tk2)

  ## Main factor: SSP
  tk3 <- with(SSPE,
              TukeyC(y ~ blk + P*SP*SSP + Error(blk/P/SP),
                     data=dfm,
                     which='SSP'))
  summary(tk3)
  
  ## Nested: p1/SSP
  tkn1 <- with(SSPE,
               TukeyC(y ~ blk + P*SP*SSP + Error(blk/P/SP),
                      data=dfm,
                      which='P:SSP',
                      fl1=1))
  summary(tkn1)

  ## From: aovlist
  av <- with(SSPE,
             aov(y ~  blk + P*SP*SSP + Error(blk/P/SP),
                 data=dfm))
  summary(av)   

  ## Nested: P1/SP1/SSP
  tkn2 <- TukeyC(av,
                 which='P:SP:SSP',
                 fl1=1,
                 fl2=1)
  summary(tkn2)

  ## Nested: P2/SP1/SSP
  tkn3 <- TukeyC(av,
                 which='P:SP:SSP',
                 fl1=2,
                 fl2=1)
  summary(tkn3)

  ## Nested: SSP2/P1/SP - it is necessary to inform how to combinate the errors
  tkn4 <- TukeyC(av,
                 which='SSP:P:SP',
                 fl1=2,
                 fl2=1,
                 error='Within/blk:P/blk:P:SP')
  summary(tkn4)




