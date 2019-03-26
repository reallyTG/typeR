### R code from vignette source 'zipfr-tutorial.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: zipfr-tutorial.Rnw:51-52
###################################################
options(useFancyQuotes=FALSE)


###################################################
### code chunk number 2: zipfr-tutorial.Rnw:83-84 (eval = FALSE)
###################################################
## install.packages("zipfR")


###################################################
### code chunk number 3: zipfr-tutorial.Rnw:96-97
###################################################
library(zipfR)


###################################################
### code chunk number 4: zipfr-tutorial.Rnw:101-102 (eval = FALSE)
###################################################
## ?zipfR


###################################################
### code chunk number 5: zipfr-tutorial.Rnw:149-150
###################################################
ItaRi.spc


###################################################
### code chunk number 6: zipfr-tutorial.Rnw:174-175
###################################################
summary(ItaRi.spc)


###################################################
### code chunk number 7: zipfr-tutorial.Rnw:183-185
###################################################
N(ItaRi.spc)
V(ItaRi.spc)


###################################################
### code chunk number 8: zipfr-tutorial.Rnw:196-198
###################################################
Vm(ItaRi.spc, 1)
Vm(ItaRi.spc, 1:5)


###################################################
### code chunk number 9: zipfr-tutorial.Rnw:206-207
###################################################
Vm(ItaRi.spc, 1) / N(ItaRi.spc)


###################################################
### code chunk number 10: zipfr-tutorial.Rnw:214-216 (eval = FALSE)
###################################################
## plot(ItaRi.spc)
## plot(ItaRi.spc, log="x")


###################################################
### code chunk number 11: zipfr-tutorial.Rnw:221-222
###################################################
plot(ItaRi.spc)


###################################################
### code chunk number 12: zipfr-tutorial.Rnw:225-226
###################################################
plot(ItaRi.spc, log="x")


###################################################
### code chunk number 13: zipfr-tutorial.Rnw:242-243
###################################################
with(ItaRi.spc, plot(m, Vm, main="Frequency Spectrum"))


###################################################
### code chunk number 14: zipfr-tutorial.Rnw:312-313
###################################################
head(ItaRi.emp.vgc)


###################################################
### code chunk number 15: zipfr-tutorial.Rnw:327-328
###################################################
ItaRi.emp.vgc


###################################################
### code chunk number 16: zipfr-tutorial.Rnw:332-333
###################################################
summary(ItaRi.emp.vgc)


###################################################
### code chunk number 17: zipfr-tutorial.Rnw:342-343
###################################################
plot(ItaRi.emp.vgc, add.m=1)


###################################################
### code chunk number 18: zipfr-tutorial.Rnw:372-374
###################################################
ItaRi.bin.vgc <- vgc.interp(ItaRi.spc, N(ItaRi.emp.vgc), m.max=1)
head(ItaRi.bin.vgc)


###################################################
### code chunk number 19: zipfr-tutorial.Rnw:398-400
###################################################
plot(ItaRi.emp.vgc, ItaRi.bin.vgc, 
     legend=c("observed", "interpolated"))


###################################################
### code chunk number 20: zipfr-tutorial.Rnw:431-433
###################################################
V(ItaRi.emp.vgc)[N(ItaRi.emp.vgc) == 50000]
V(ItaRi.spc)


###################################################
### code chunk number 21: zipfr-tutorial.Rnw:481-482
###################################################
ItaRi.fzm <- lnre("fzm", ItaRi.spc, exact=FALSE)


###################################################
### code chunk number 22: zipfr-tutorial.Rnw:497-498
###################################################
summary(ItaRi.fzm)


###################################################
### code chunk number 23: zipfr-tutorial.Rnw:516-517
###################################################
ItaRi.fzm.spc <- lnre.spc(ItaRi.fzm, N(ItaRi.fzm))


###################################################
### code chunk number 24: zipfr-tutorial.Rnw:522-523
###################################################
plot(ItaRi.spc, ItaRi.fzm.spc, legend=c("observed", "fZM"))


###################################################
### code chunk number 25: zipfr-tutorial.Rnw:534-535
###################################################
ItaRi.fzm.vgc <- lnre.vgc(ItaRi.fzm, (1:100) * 28e3)


###################################################
### code chunk number 26: zipfr-tutorial.Rnw:552-554
###################################################
plot(ItaRi.emp.vgc, ItaRi.fzm.vgc, N0=N(ItaRi.fzm), 
     legend=c("observed", "fZM"))


###################################################
### code chunk number 27: zipfr-tutorial.Rnw:615-617
###################################################
set.seed(42)
ItaRi.sub.spc <- sample.spc(ItaRi.spc, N=700000)


###################################################
### code chunk number 28: zipfr-tutorial.Rnw:624-626
###################################################
ItaRi.sub.fzm <- lnre("fzm", ItaRi.sub.spc, exact=FALSE)
ItaRi.sub.fzm


###################################################
### code chunk number 29: zipfr-tutorial.Rnw:636-637
###################################################
ItaRi.sub.fzm.vgc <- lnre.vgc(ItaRi.sub.fzm, N=N(ItaRi.emp.vgc))


###################################################
### code chunk number 30: zipfr-tutorial.Rnw:647-649
###################################################
  plot(ItaRi.bin.vgc, ItaRi.sub.fzm.vgc, N0=N(ItaRi.sub.fzm),
       legend=c("interpolated", "fZM"))


###################################################
### code chunk number 31: zipfr-tutorial.Rnw:688-690
###################################################
V(ItaUltra.spc)
V(ItaRi.spc)


###################################################
### code chunk number 32: zipfr-tutorial.Rnw:696-698
###################################################
N(ItaUltra.spc)
N(ItaRi.spc)


###################################################
### code chunk number 33: zipfr-tutorial.Rnw:705-707
###################################################
ItaUltra.fzm <- lnre("fzm", ItaUltra.spc, exact=FALSE)
ItaUltra.ext.vgc <- lnre.vgc(ItaUltra.fzm, N(ItaRi.emp.vgc))


###################################################
### code chunk number 34: zipfr-tutorial.Rnw:712-713
###################################################
plot(ItaUltra.ext.vgc, ItaRi.bin.vgc, legend=c("ultra-", "ri-"))


###################################################
### code chunk number 35: zipfr-tutorial.Rnw:727-728 (eval = FALSE)
###################################################
## data(package="zipfR")


###################################################
### code chunk number 36: zipfr-tutorial.Rnw:732-733 (eval = FALSE)
###################################################
## ?ItaRi.spc


###################################################
### code chunk number 37: zipfr-tutorial.Rnw:790-791
###################################################
V(Brown100k.spc)


###################################################
### code chunk number 38: zipfr-tutorial.Rnw:800-802
###################################################
Vseen <- V(Brown100k.spc) - Vm(Brown100k.spc, 1)
Vseen


###################################################
### code chunk number 39: zipfr-tutorial.Rnw:808-809
###################################################
Vseen / V(Brown100k.spc)


###################################################
### code chunk number 40: zipfr-tutorial.Rnw:815-816
###################################################
Vm(Brown100k.spc, 1) / N(Brown100k.spc)


###################################################
### code chunk number 41: zipfr-tutorial.Rnw:846-848
###################################################
Brown100k.zm <- lnre("zm", Brown100k.spc)
Brown100k.zm


###################################################
### code chunk number 42: zipfr-tutorial.Rnw:865-866
###################################################
EV(Brown100k.zm, c(1e6, 10e6, 100e6))


###################################################
### code chunk number 43: zipfr-tutorial.Rnw:873-874
###################################################
Vseen / EV(Brown100k.zm, c(1e6, 10e6, 100e6))


###################################################
### code chunk number 44: zipfr-tutorial.Rnw:879-880
###################################################
1 - (Vseen / EV(Brown100k.zm, c(1e6, 10e6, 100e6)))


###################################################
### code chunk number 45: zipfr-tutorial.Rnw:888-890
###################################################
N(Brown.spc)
V(Brown.spc)


###################################################
### code chunk number 46: zipfr-tutorial.Rnw:894-895
###################################################
EV(Brown100k.zm, N(Brown.spc)) 


###################################################
### code chunk number 47: zipfr-tutorial.Rnw:902-904
###################################################
1 - (Vseen / V(Brown.spc))
1 - (Vseen / EV(Brown100k.zm, N(Brown.spc)))


###################################################
### code chunk number 48: zipfr-tutorial.Rnw:930-931
###################################################
Brown.zm.spc <- lnre.spc(Brown100k.zm, N(Brown.spc))


###################################################
### code chunk number 49: zipfr-tutorial.Rnw:942-943
###################################################
EV(Brown100k.zm, N(Brown.spc)) - Vseen 


###################################################
### code chunk number 50: zipfr-tutorial.Rnw:949-951
###################################################
sum(Vm(Brown.zm.spc, 1))
sum(Vm(Brown.zm.spc, 1:2))


###################################################
### code chunk number 51: zipfr-tutorial.Rnw:954-955
###################################################
sum(Vm(Brown.zm.spc, 1:6))


###################################################
### code chunk number 52: zipfr-tutorial.Rnw:964-966
###################################################
Noov.zm <- sum(Vm(Brown.zm.spc, 1:6) * (1:6))
Noov.zm


###################################################
### code chunk number 53: zipfr-tutorial.Rnw:970-971
###################################################
Noov.zm / N(Brown.spc)


###################################################
### code chunk number 54: zipfr-tutorial.Rnw:980-981
###################################################
V(Brown.spc) - Vseen


###################################################
### code chunk number 55: zipfr-tutorial.Rnw:986-987
###################################################
sum(Vm(Brown.spc, 1:13))


###################################################
### code chunk number 56: zipfr-tutorial.Rnw:992-995
###################################################
Noov.emp <- sum(Vm(Brown.spc, 1:13) * (1:13))
Noov.emp
Noov.emp / N(Brown.spc)


###################################################
### code chunk number 57: zipfr-tutorial.Rnw:1017-1018
###################################################
Brown10M.zm.spc <- lnre.spc(Brown100k.zm, 10e6)


###################################################
### code chunk number 58: zipfr-tutorial.Rnw:1029-1030
###################################################
sum(Vm(Brown10M.zm.spc, 1:18) * (1:18))


###################################################
### code chunk number 59: zipfr-tutorial.Rnw:1035-1036
###################################################
sum(Vm(Brown10M.zm.spc, 1:18))


###################################################
### code chunk number 60: zipfr-tutorial.Rnw:1042-1043
###################################################
 EV(Brown100k.zm, 10e6) - sum(Vm(Brown10M.zm.spc, 1:18))


