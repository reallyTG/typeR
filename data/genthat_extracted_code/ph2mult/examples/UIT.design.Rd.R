library(ph2mult)


### Name: UIT.design
### Title: The design function for multinomial designs under
###   union-intersection test (UIT)
### Aliases: UIT.design

### ** Examples


## Calculate type I error for single-stage design
UIT.design(method="s1",s1.rej=18, t1.rej = 12, n1=80,
p0.s = 0.15, p0.t = 0.25, p1.s = 0.3, p1.t= 0.1)

## Designs for two-stage design, output PET and EN under null hypothesis
UIT.design(method="s2",s1.rej = 11, t1.rej = 4, s1.acc=8, t1.acc = 5, n1=40,
s2.rej=18, t2.rej = 11, n2=40, p0.s = 0.15, p0.t = 0.25, p1.s = 0.3, p1.t= 0.1, output.all=TRUE)




