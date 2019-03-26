library(ScottKnott)


### Name: SK
### Title: The ScottKnott Clustering Algoritm for Single Experiments
### Aliases: SK SK.default SK.aov SK.aovlist
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
  plot(sk1,
       col=rainbow(max(sk1$groups)),
       mm.lty=3,
       id.las=2,
       rl=FALSE,
       title='factor levels')
  
  ## From: data.frame (dfm)
  sk2 <- with(CRD2,
              SK(x=dfm,
                 model='y ~ x',
                 which='x',
                 dispersion='s'))
  summary(sk2)
  plot(sk2,
       col=rainbow(max(sk2$groups)),
       id.las=2,
       rl=FALSE)
  
  ## From: aov
  av <- with(CRD2,
             aov(y ~ x,
                 data=dfm))
  summary(av)
  
  sk3 <- with(CRD2,
              SK(x=av,
                 which='x',
                 dispersion='se'))
  summary(sk3)
  plot(sk3,
       col=rainbow(max(sk3$groups)),
       rl=FALSE,
       id.las=2,
       title=NULL)

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
  plot(sk1)
  
  ## From: data.frame (dfm), which='tra'
  sk2 <- with(RCBD,
              SK(x=dfm,
                 model='y ~ blk + tra',
                 which='tra'))
  summary(sk2)
  plot(sk2,
       mm.lty=3,
       title='Factor levels')
  
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
  plot(sk1)
  
  ## From: data.frame
  sk2 <- with(LSD,
              SK(x=dfm,
                 model='y ~ rows + cols + tra',
                 which='tra'))
  summary(sk2)
  plot(sk2,
       title='Factor levels')
  
  ## From: aov
  av <- with(LSD,
             aov(y ~ rows + cols + tra,
                 data=dfm))
  summary(av)
  
  sk3 <- SK(av,
            which='tra')
  summary(sk3)
  plot(sk3,
       title='Factor levels')

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
  plot(sk1,
       title='Main effect: N')

  ## Nested: p1/N
  nsk1 <- with(FE,
               SK.nest(x=dm,
                       y=y,
                       model='y ~ blk + N*P*K',
                       which='P:N',
                       fl1=1))
  summary(nsk1)
  plot(nsk1,
       title='Effect: p1/N')



