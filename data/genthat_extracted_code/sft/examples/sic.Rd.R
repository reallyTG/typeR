library(sft)


### Name: sic
### Title: Calculate the Survivor Interaction Contrast
### Aliases: sic
### Keywords: sft

### ** Examples

T1.h <- rexp(50, .2)
T1.l <- rexp(50, .1)
T2.h <- rexp(50, .21)
T2.l <- rexp(50, .11)

SerialAND.hh <- T1.h + T2.h
SerialAND.hl <- T1.h + T2.l
SerialAND.lh <- T1.l + T2.h
SerialAND.ll <- T1.l + T2.l
SerialAND.sic <- sic(HH=SerialAND.hh, HL=SerialAND.hl, LH=SerialAND.lh, 
  LL=SerialAND.ll)
print(SerialAND.sic$Dvals)
plot(SerialAND.sic$SIC, do.p=FALSE, ylim=c(-1,1))

p1 <- runif(200) < .3
SerialOR.hh <- p1[1:50]    * T1.h + (1-p1[1:50]   )*T2.h
SerialOR.hl <- p1[51:100]  * T1.h + (1-p1[51:100] )*T2.l
SerialOR.lh <- p1[101:150] * T1.l + (1-p1[101:150])*T2.h
SerialOR.ll <- p1[151:200] * T1.l + (1-p1[151:200])*T2.l
SerialOR.sic <- sic(HH=SerialOR.hh, HL=SerialOR.hl, LH=SerialOR.lh, LL=SerialOR.ll)
print(SerialOR.sic$Dvals)
plot(SerialOR.sic$SIC, do.p=FALSE, ylim=c(-1,1))

ParallelAND.hh <- pmax(T1.h, T2.h)
ParallelAND.hl <- pmax(T1.h, T2.l)
ParallelAND.lh <- pmax(T1.l, T2.h)
ParallelAND.ll <- pmax(T1.l, T2.l)
ParallelAND.sic <- sic(HH=ParallelAND.hh, HL=ParallelAND.hl, LH=ParallelAND.lh, 
  LL=ParallelAND.ll)
print(ParallelAND.sic$Dvals)
plot(ParallelAND.sic$SIC, do.p=FALSE, ylim=c(-1,1))

ParallelOR.hh <- pmin(T1.h, T2.h)
ParallelOR.hl <- pmin(T1.h, T2.l)
ParallelOR.lh <- pmin(T1.l, T2.h)
ParallelOR.ll <- pmin(T1.l, T2.l)
ParallelOR.sic <- sic(HH=ParallelOR.hh, HL=ParallelOR.hl, LH=ParallelOR.lh, 
  LL=ParallelOR.ll)
print(ParallelOR.sic$Dvals)
plot(ParallelOR.sic$SIC, do.p=FALSE, ylim=c(-1,1))



