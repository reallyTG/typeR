library(ScottKnott)


### Name: summary
### Title: Summary Method for SK and SK.nest Objects
### Aliases: summary.SK summary.SK.nest
### Keywords: package htest univar tree design

### ** Examples

  ##
  ## Examples: Completely Randomized Design (CRD)
  ## More details: demo(package='ScottKnott')
  ##
  
  ## The parameters can be: vectors, design matrix and the response variable,
  ## data.frame or aov
  data(CRD2)
  
  ## From: design matrix (dm) and response variable (y)
  sk1 <- with(CRD2,
              SK(x=dm,
                 y=y,
                 model='y ~ x',
                 which='x'))
  summary(sk1)

  ##
  ## Example: Randomized Complete Block Design (RCBD)
  ## More details: demo(package='ScottKnott')
  ##
  
  ## The parameters can be: design matrix and the response variable,
  ## data.frame or aov
  
  data(RCBD)
  
  ## Design matrix (dm) and response variable (y)
  sk1 <- with(RCBD,
              SK(x=dm,
                 y=y,
                 model='y ~ blk + tra',
                 which='tra'))
  summary(sk1)

  ##
  ## Example: Latin Squares Design (LSD)
  ## More details: demo(package='ScottKnott')
  ##
  
  ## The parameters can be: design matrix and the response variable,
  ## data.frame or aov
  
  data(LSD)
  
  ## From: design matrix (dm) and response variable (y)
  sk1 <- with(LSD,
              SK(x=dm,
                 y=y,
                 model='y ~ rows + cols + tra',
                 which='tra'))
  summary(sk1)

  ##
  ## Example: Factorial Experiment (FE)
  ## More details: demo(package='ScottKnott')
  ##
  
  ## The parameters can be: design matrix and the response variable,
  ## data.frame or aov
  
  ## Note: The factors are in uppercase and its levels in lowercase!

  data(FE)

  ## From: design matrix (dm) and response variable (y)
  ## Main factor: N
  sk1 <- with(FE,
              SK(x=dm,
                 y=y,
                 model='y ~ blk + N*P*K', 
                 which='N'))
  summary(sk1)

  ## Nested: p1/N
  nsk1 <- with(FE, 
               SK.nest(x=dm,
                       y=y,
                       model='y ~ blk + N*P*K',
                       which='P:N',
                       fl1=1))
  summary(nsk1)

  ## Nested: k2/p2/N
  nsk2 <- with(FE,
               SK.nest(x=dm,
                       y=y,
                       model='y ~ blk + N*P*K',
                       which='K:P:N',
                       fl1=2,
                       fl2=2))
  summary(nsk2)

  ## Nested: k1/n1/P
  nsk3 <- with(FE,
               SK.nest(x=dm,
                       y=y,
                       model='y ~ blk + P*N*K',
                       which='K:N:P',
                       fl1=1,
                       fl2=1))
  summary(nsk3)

  ## Nested: p1/n1/K
  nsk4 <- with(FE,
               SK.nest(x=dm,
                       y=y,
                       model='y ~ blk + K*N*P',
                       which='P:N:K',
                       fl1=1, 
                       fl2=1))
  summary(nsk4)

  ##
  ## Example: Split-plot Experiment (SPE)
  ## More details: demo(package='ScottKnott')
  ##
  
  ## Note: The factors are in uppercase and its levels in lowercase!

  data(SPE)

  ## The parameters can be: design matrix and the response variable,
  ## data.frame or aov
  
  ## From: design matrix (dm) and response variable (y)
  ## Main factor: P
  sk1 <- with(SPE,
              SK(x=dm,
                 y=y,
                 model='y ~ blk + SP*P + Error(blk/P)',
                 which='P',
                 error='blk:P'))
  summary(sk1)

  ## Nested: p1/SP
  skn1 <- with(SPE,
               SK.nest(x=dm,
                       y=y,
                       model='y ~ blk + SP*P + Error(blk/P)',
                       which='P:SP',
                       error='Within',
                       fl1=1))
  summary(skn1)

  data(SSPE)

  ## From: design matrix (dm) and response variable (y)
  ## Main factor: P
  sk1 <- with(SSPE,
              SK(dm,
                 y,
                 model='y ~ blk + P*SP*SSP + Error(blk/P/SP)',
                 which='P',
                 error='blk:P'))
  summary(sk1)
  
  # Main factor: SP
  sk2 <- with(SSPE,
              SK(dm,
                 y,
                 model='y ~ blk + P*SP*SSP + Error(blk/P/SP)',
                 which='SP',
                 error='blk:P:SP'))
  summary(sk2)
  
  # Main factor: SSP
  sk3 <- with(SSPE,
              SK(dm,
                 y,
                 model='y ~ blk + P*SP*SSP + Error(blk/P/SP)',
                which='SSP',
                error='Within'))
  summary(sk3)
  
  ## Nested: p1/sp
  skn1 <- with(SSPE,
               SK.nest(dm,
                       y,
                       model='y ~ blk + P*SP*SSP + Error(blk/P/SP)',
                       which='P:SP',
                       error='blk:P:SP',
                       fl1=1))
  summary(skn1)

  ## From: aovlist
  av <- with(SSPE,
             aov(y ~  blk + P*SP*SSP + Error(blk/P/SP),
                 data=dfm))
  summary(av)   

  ## Nested: p/sp/SSP (at various levels of SP and P) 
  skn2 <- SK.nest(av,
                  which='P:SP:SSP',
                  error='Within',
                  fl1=1,
                  fl2=1)
  summary(skn2)

  skn3 <- SK.nest(av,
                  which='P:SP:SSP',
                  error='Within', 
                  fl1=1,
                  fl2=2)
  summary(skn3)



