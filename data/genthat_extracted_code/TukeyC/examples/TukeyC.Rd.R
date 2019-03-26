library(TukeyC)


### Name: TukeyC
### Title: The TukeyC Test for Single Experiments
### Aliases: TukeyC TukeyC.default TukeyC.lm TukeyC.formula TukeyC.aovlist
###   TukeyC.lmerMod
### Keywords: package

### ** Examples

##
## Examples:Randomized Complete Block Design (RCBD)
## More details: demo(package='TukeyC')
##

## The parameters can be: formula, aov, lm, aovlist and lmerMod

data(RCBD)

## From: formula
tk1 <- with(RCBD,
            TukeyC(y ~ blk + tra,
                   data=dfm,
                   which='tra'))
summary(tk1)

## From: merMod
## This class is specific of the lme4 package.
if(require(lme4)){ 
  lmer1 <- with(RCBD,
                lmer(y ~ (1|blk) + tra,
                     data=dfm))

  tk2 <-  TukeyC(lmer1,
                 which='tra')
  summary(tk2)
} 

##
## Example: Latin Squares Design (LSD)
## More details: demo(package='TukeyC')
##

data(LSD)

## From: formula
tk3 <- with(LSD,
            TukeyC(y ~ rows + cols + tra,
                   data=dfm,
                   which='tra'))
summary(tk3)

## From: aov
av1 <- with(LSD,
            aov(y ~ rows + cols + tra,
                data=dfm))

tk4 <- TukeyC(av1,
              which='tra')
summary(tk4)

## From: lm
lm1 <- with(LSD,
            lm(y ~ rows + cols + tra,
               data=dfm))

tk5 <- TukeyC(lm1,
              which='tra')
summary(tk5)

##
## Example: Factorial Experiment (FE)
## More details: demo(package='TukeyC')
##

data(FE)
## From: formula
## Main factor: N
tk6 <- with(FE,
            TukeyC(y ~ blk + N*P*K,
                   data=dfm,
                   which='N'))
summary(tk6)

## Nested: p1/N
# From: formula
n_tk1 <- with(FE,
              TukeyC(y ~ blk + N*P*K,
                     data=dfm,
                     which='P:N',
                     fl1=1))
summary(n_tk1) 

## Nested: p2/N
# From: lm
lm2 <- with(FE,
            lm(y ~ blk + N*P*K, 
               dfm))

n_tk2 <- with(FE,
              TukeyC(lm2,
                     which='P:N',
                     fl1=2))
summary(n_tk2) 

## Nested: n1/P
# From: aov
av2 <- with(FE,
            aov(y ~ blk + N*P*K,
                dfm))

n_tk3 <- with(FE,
              TukeyC(av2,
                     which='N:P',
                     fl1=1))
summary(n_tk3) 

# From: merMod
## Not run: 
##D if(require(lme4)){
##D   lmer2 <- with(FE,
##D                 lmer(y ~ (1|blk) + N*P*K,
##D                      dfm))
##D 
##D   n_tk4 <- with(FE,
##D                 TukeyC(lmer2,
##D                        which='N:P',
##D                        fl1=1))
##D   summary(n_tk4) 
##D }
## End(Not run)

##
## Example: Split-plot Experiment (SPET)
## More details: demo(package='TukeyC')
##
data(SPET)

## From lm
lm3 <- with(SPET,
            lm(y ~ blk*tra + tra*year,
               dfm))

# crotgrantiana/year
sp_tk1 <- TukeyC(lm3,
                 which='tra:year',
                 fl1=1)
summary(sp_tk1) 

# year1/tra
# It is necessary to set year error with trat error in the order of the "which" argument.
# It is necessary to inform how to combinate the errors
sp_tk2 <-  TukeyC(lm3,
                  which='year:tra',
                  error='Residuals/blk:tra',
                  fl1=1)
summary(sp_tk2)

# From merMod
# Onty tra
## Not run: 
##D if(require(lme4)){ 
##D   lmer3 <- with(SPET,
##D                 lmer(y ~ blk + (1|blk:tra) + tra*year,
##D                      dfm))
##D 
##D   # comparison only tra
##D   sp_tk3 <- TukeyC(lmer3,
##D                    which = 'tra',
##D                    error = 'blk:tra')
##D   summary(sp_tk3)  
##D 
##D   # year1/tra
##D   sp_tk4 <- TukeyC(lmer3,
##D                    which='year:tra',
##D                    error='Residual/blk:tra',
##D                    fl1=1)
##D   summary(sp_tk4)
##D } 
## End(Not run)

## Example: Split-split-plot Experiment (SSPE)
## More details: demo(package='TukeyC')
##

data(SSPE)
## From: formula
## Main factor: P
## It is necessary to inform the appropriate error for the test
ssp_tk1 <- with(SSPE,
                TukeyC(y ~ blk + P*SP*SSP + Error(blk/P/SP),
                       data=dfm,
                       which='P',
                       error='blk:P'))
summary(ssp_tk1)

## Main factor: SP
## It is necessary to inform the appropriate error for the test
ssp_tk2 <- with(SSPE,
                TukeyC(y ~ blk + P*SP*SSP + Error(blk/P/SP),
                       data=dfm,
                       which='SP',
                       error='blk:P:SP'))
summary(ssp_tk2)

## Main factor: SSP
ssp_tk3 <- with(SSPE,
                TukeyC(y ~ blk + P*SP*SSP + Error(blk/P/SP),
                       data=dfm,
                       which='SSP'))
summary(ssp_tk3)

## From: aov
## Main factor: SSP
av3 <- with(SSPE,
            aov(y ~ blk + P*SP*SSP + Error(blk/P/SP),
                data=dfm))

ssp_tk4 <- TukeyC(av3,
                  which='SSP')
summary(ssp_tk4)

## Nested: p1/SP
## It is necessary to inform the appropriate error for the test
ssp_tk5 <- TukeyC(av3,
                  which='P:SP',
                  error='blk:P:SP',
                  fl1=1)
summary(ssp_tk5)

## Nested: p1/SSP
ssp_tk6 <- TukeyC(av3,
                  which='P:SSP',
                  fl1=1)
summary(ssp_tk6)

## Nested: p1/sp1/SSP
## Testing SSP inside of level one of P and level one of SP
ssp_tk7 <- TukeyC(av3,
                  which='P:SP:SSP',
                  fl1=1,
                  fl2=1)
summary(ssp_tk7)

## Nested: p2/sp1/SSP
ssp_tk8 <- TukeyC(av3,
                  which='P:SP:SSP',
                  fl1=2,
                  fl2=1)
summary(ssp_tk8)

## Nested: sp1/P
## It is necessary to inform the appropriate error for the test
ssp_tk9 <- TukeyC(av3,
                  which='SP:P',
                  error='blk:P:SP/blk:P',
                  fl1=1)

summary(ssp_tk9)

## Nested: ssp1/SP
ssp_tk10 <- TukeyC(av3,
                   which='SSP:SP',
                   error='Within/blk:P:SP',
                   fl1=1)
summary(ssp_tk10)

## Nested: ssp1/sp1/P
## It is necessary to inform the appropriate error for the test
ssp_tk11 <- TukeyC(av3,
                   which='SSP:SP:P',
                   error='Within/blk:P:SP/blk:P',
                   fl1=1,
                   fl2=1)
summary(ssp_tk11)

## UNBALANCED DATA
## The average are adjusted by "Least-Square-Means" methodology.
## From: formula
data(CRD2)

uCRD2 <- CRD2$dfm
uCRD2[c(3, 5, 10, 44, 45), 3] <- NA

utk1 <-  TukeyC(y ~ x,
                data=uCRD2,
                which='x')
summary(utk1)

## From: lm
ulm1 <- lm(y ~ x,
           data=uCRD2)

utk2 <- TukeyC(ulm1,
               which='x')
summary(utk2)


## Factorial Experiments
## Nested: p1/N
# From: lm

uFE <- FE$dfm
uFE[c(3, 6, 7, 20, 31, 32), 5] <- NA

ulm2 <- lm(y ~ blk + N*P*K,
           uFE)

## Nested: p1/N
utk3 <- TukeyC(ulm2,
               data=uFE,
               which='P:N',
               fl1=1)
summary(utk3) 

## Nested: p2/n2/K
utk4 <- TukeyC(ulm2,
               data=uFE,
               which='P:N:K',
               fl1=2,
               fl2=2)
summary(utk4) 



