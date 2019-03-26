library(ph2mult)


### Name: IUT.design
### Title: The design function for multinomial designs under
###   intersection-union test (IUT)
### Aliases: IUT.design

### ** Examples

p01=0.1; p02=0.9
## Calculate type I error for single-stage design
IUT.design(method="s1",s1.rej=18, t1.rej = 12, n1=80,
s1.rej.delta = 1, t1.rej.delta = 1, n1.delta=1,
p0.s = 0.15, p0.t = 0.25, p1.s = 0.3, p1.t= 0.1, output = "minimax")

## Designs for two-stage design, output PET and EN under null hypothesis
IUT.design(method="s2",s1.rej = 11, t1.rej = 4, s1.acc=8, t1.acc = 5, n1=40,
s2.rej=18, t2.rej = 11, n2=40, p0.s = 0.15, p0.t = 0.25, p1.s = 0.3, p1.t= 0.1, output = "minimax")
IUT.design(method="s2",s1.rej = 11, t1.rej = 4, s1.acc=8, t1.acc = 5, n1=40,
s2.rej=18, t2.rej = 11, n2=40, p0.s = 0.15, p0.t = 0.25, p1.s = 0.3, p1.t= 0.1, output = "optimal")




