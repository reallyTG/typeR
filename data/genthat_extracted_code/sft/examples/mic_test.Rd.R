library(sft)


### Name: mic.test
### Title: Test of the Mean Interaction Contrast
### Aliases: mic.test
### Keywords: sft

### ** Examples

T1.h <- rweibull(300, shape=2 , scale=400 )
T1.l <- rweibull(300, shape=2 , scale=800 )
T2.h <- rweibull(300, shape=2 , scale=400 )
T2.l <- rweibull(300, shape=2 , scale=800 )

Serial.hh <- T1.h + T2.h
Serial.hl <- T1.h + T2.l
Serial.lh <- T1.l + T2.h
Serial.ll <- T1.l + T2.l
mic.test(HH=Serial.hh, HL=Serial.hl, LH=Serial.lh, LL=Serial.ll)

Parallel.hh <- pmax(T1.h, T2.h)
Parallel.hl <- pmax(T1.h, T2.l)
Parallel.lh <- pmax(T1.l, T2.h)
Parallel.ll <- pmax(T1.l, T2.l)
mic.test(HH=Parallel.hh, HL=Parallel.hl, LH=Parallel.lh, LL=Parallel.ll, method="art")




