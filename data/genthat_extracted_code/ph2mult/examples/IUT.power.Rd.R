library(ph2mult)


### Name: IUT.power
### Title: The power function for multinomial designs under
###   intersection-union test (IUT)
### Aliases: IUT.power

### ** Examples

p01=0.1; p02=0.9
## Calculate type I error for single-stage design
max(IUT.power(method="s1", s1.rej=6, t1.rej=19, n1=25, p.s=p01, p.t=0),
IUT.power(method="s1", s1.rej=6, t1.rej=19, n1=25, p.s=1-p02, p.t=p02))
## Calculate power for single-stage design
IUT.power(method="s1", s1.rej=6, t1.rej=19, n1=25, p.s=p01+0.2, p.t=p02-0.2)

## Calculate type I error for two-stage design
max(IUT.power(method="s2", s1.rej=4, t1.rej=9, s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01, p.t=0),
IUT.power(method="s2", s1.rej=4, t1.rej=9, s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=1-p02, p.t=p02))
## Output PET and EN under null hypothesis
IUT.power(method="s2", s1.rej=4, t1.rej=9, s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01, p.t=p02, output.all=TRUE)[-1]
## Calculate power for two-stage design
IUT.power(method="s2", s1.rej=4, t1.rej=9, s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01+0.2, p.t=p02-0.2)

## Calculate type I error for two-stage design stopping for futility only,
## output PET and EN under null hypothesis
max(IUT.power(method="s2.f", s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01, p.t=0),
IUT.power(method="s2.f", s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=1-p02, p.t=p02))
## Output PET and EN under null hypothesis
IUT.power(method="s2.f", s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01, p.t=p02, output.all=TRUE)[-1]
## Calculate power for two-stage design
IUT.power(method="s2.f", s1.acc=0, t1.acc=13, n1=13,
s2.rej=6, t2.rej=18, n2=11, p.s=p01+0.2, p.t=p02-0.2)



