library(calibrator)


### Name: stage1
### Title: Stage 1,2 and 3 optimization on toy dataset
### Aliases: stage1 stage2 stage3
### Keywords: array

### ** Examples

data(toys)
stage1(D1=D1.toy,y=y.toy,H1=H1.toy, maxit=5, phi.fun=phi.fun.toy, phi=phi.toy)

##now try with a slightly bigger dataset:
##Examples below take a few minutes to run:

set.seed(0)
data(toys)
jj <- create.new.toy.datasets(D1.toy , D2.toy)
y.toy <- jj$y.toy
z.toy <- jj$z.toy
d.toy <- jj$d.toy

phi.toy.stage1 <- stage1(D1=D1.toy, y=y.toy, H1=H1.toy, maxit=10, phi.fun=phi.fun.toy, phi=phi.toy)

phi.toy.stage2 <- stage2(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy,
 y=y.toy, z=z.toy, extractor=extractor.toy,
phi.fun=phi.fun.toy, E.theta=E.theta.toy, Edash.theta=Edash.theta.toy,
maxit=3, phi=phi.toy.stage1)

stage3(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, d=d.toy, maxit=3, phi=phi.toy.stage2)

# Now try with the true values of the hyperparameters:
phi.true <- phi.true.toy(phi=phi.toy)

stage3(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, d=d.toy, maxit=3, phi=phi.true)




