library(ScottKnott)


### Name: ScottKnott-package
### Title: The ScottKnott Clustering Algorithm
### Aliases: ScottKnott-package ScottKnott
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
     title='Factor levels')

## From: data.frame (dfm)
sk2 <- with(CRD2, 
            SK(x=dfm,
               model='y ~ x',
               which='x',
               dispersion='se'))
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

sk3 <- SK(x=av,
          which='x')
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
## Studing N inside of level one of P
nsk1 <- with(FE,
             SK.nest(x=dm,
                     y=y,
                     model='y ~ blk + N*P*K',
                     which='P:N',
                     fl1=1))
summary(nsk1)
plot(nsk1,
     title='Effect: p1/N')

## Nested: k1/P
nsk2 <- with(FE,
             SK.nest(x=dm,
                     y=y,
                     model='y ~ blk + N*P*K',
                     which='K:P',
                     fl1=1))
summary(nsk2)
plot(nsk2,
     title='Effect: k1/P')

## Nested: k2/p2/N
nsk3 <- with(FE,
             SK.nest(x=dm,
                     y=y,
                     model='y ~ blk + N*P*K',
                     which='K:P:N',
                     fl1=2,
                     fl2=2))
summary(nsk3)
plot(nsk3,
     title='Effect: k2/p2/N')

## Nested: k1/n1/P
## Studing P inside of level one of K and level one of N
nsk4 <- with(FE, 
             SK.nest(x=dm,
                     y=y,
                     model='y ~ blk + N*P*K',
                     which='K:N:P',
                     fl1=1,
                     fl2=1))
summary(nsk4)
plot(nsk4,
     title='Effect: k1/n1/P')

## Nested: p1/n1/K
nsk5 <- with(FE,
             SK.nest(x=dm,
                     y=y,
                     model='y ~ blk + N*P*K',
                     which='P:N:K',
                     fl1=1,
                     fl2=1))
summary(nsk5)
plot(nsk5, title='Effect: p1/n1/K')

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
               model='y ~ blk + P*SP + Error(blk/P)',
               which='P',
               error='blk:P'))
summary(sk1)
plot(sk1)

## Main factor: SP
sk2 <- with(SPE,
            SK(x=dm,
               y=y,
               model='y ~ blk + P*SP + Error(blk/P)',
               which='SP', 
               error='Within'))
summary(sk2)
plot(sk2,
     xlab='Groups',
     ylab='Main effect: sp',
     title='Main effect: SP')

## Nested: p1/SP
skn1 <- with(SPE,
             SK.nest(x=dm,
                     y=y,
                     model='y ~ blk + P*SP + Error(blk/P)',
                     which='P:SP',
                     error='Within',
                     fl1=1 ))
summary(skn1)
plot(skn1,
     title='Effect: p1/SP')

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

## Nested: p/sp/SSP (at various levels of sp and p) 
skn6 <- SK.nest(av,
                which='P:SP:SSP',
                error='Within',
                fl1=1,
                fl2=1)
summary(skn6)

skn7 <- SK.nest(av,
                which='P:SP:SSP',
                error='Within',
                fl1=2,
                fl2=1)
summary(skn7)



