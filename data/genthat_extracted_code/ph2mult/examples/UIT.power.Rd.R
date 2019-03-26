library(ph2mult)


### Name: UIT.power
### Title: The power function for multinomial designs under
###   union-intersection test (UIT)
### Aliases: UIT.power

### ** Examples

p01=0.1; p02=0.9
## Calculate type I error for single-stage design
UIT.power(method="s1", s1.rej=6, t1.rej=19, n1=25, p.s=p01, p.t=p02)
## Calculate power for single-stage design
UIT.power(method="s1", s1.rej=6, t1.rej=19, n1=25, p.s=p01+0.2, p.t=p02-0.2)

## Calculate type I error for two-stage design, output PET and EN under null hypothesis
UIT.power(method="s2", s1.rej=4, t1.rej=9, s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01, p.t=p02, output.all=TRUE)
## Calculate power for two-stage design
UIT.power(method="s2", s1.rej=4, t1.rej=9, s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01+0.2, p.t=p02-0.2)

## Calculate type I error for two-stage design stopping for futility only,
## output PET and EN under null hypothesis
UIT.power(method="s2.f", s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01, p.t=p02, output.all=TRUE)
## Calculate power for two-stage design
UIT.power(method="s2.f", s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01+0.2, p.t=p02-0.2)



