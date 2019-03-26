library(ScottKnott)


### Name: SK.nest
### Title: The ScottKnott Clustering Algoritm for Factorial, Split-plot and
###   Split-SPlit plot Experiments
### Aliases: SK.nest SK.nest.default SK.nest.aov SK.nest.aovlist
### Keywords: package htest univar tree design

### ** Examples

  ##
  ## Example: Split-split-plot Experiment (SSPE)
  ## More details: demo(package='ScottKnott')
  ##
  
  ## Note: The factors are in uppercase and its levels in lowercase!

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
                 error='blk:P:SP',
                 dispersion='s'))
  summary(sk2)
  
  # Main factor: SSP
  sk3 <- with(SSPE,
              SK(dm,
                 y,
                 model='y ~ blk + P*SP*SSP + Error(blk/P/SP)',
                 which='SSP',
                 error='Within',
                 dispersion='se'))
  summary(sk3)
  
  ## Nested: p1/SP
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

  ## Nested: p/sp/SSP
  ## Studing SSP inside of level one of P and level one of SP
  skn2 <- SK.nest(av,
                  which='P:SP:SSP',
                  error='Within',
                  fl1=1,
                  fl2=1)
  summary(skn2)

  ## Studing SSP inside of level one of P and level two of SP
  skn3 <- SK.nest(av,
                  which='P:SP:SSP',
                  error='Within',
                  fl1=1,
                  fl2=2)
  summary(skn3)



