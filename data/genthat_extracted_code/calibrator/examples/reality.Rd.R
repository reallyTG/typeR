library(calibrator)


### Name: reality
### Title: Reality
### Aliases: reality computer.model model.inadequacy phi.true.toy phi.true
### Keywords: array

### ** Examples


  data(toys)


  computer.model(X=D2.toy,params=theta.toy)
  computer.model(D1.toy)
  computer.model(X=x.toy, params=extractor.toy(D1.toy)$t.vec)


  phi.fix <- phi.change(old.phi=phi.toy,
           psi1=c(1, 0.5, 1, 1, 0.5,  0.4),phi.fun=phi.fun.toy)
      #The values come from c(REAL.SCALES,REAL.SIGMA1SQUARED) as
      #seen in the sourcecode for computer.model().

  computer.model(D1.toy)   # use debug(computer.model) and examine
                           # var.matrix directly.  It should match the
                           #  output from V1():


          # first fix phi so that it has the correct values for psi1 (see the
          # section on psi1 in ?phi.fun.toy for how to get this):

   phi.fix <- phi.change(old.phi=phi.toy,psi1=c(1, 0.5, 1.0, 1.0, 0.5,
   0.4), phi.fun=phi.fun.toy)
   V1(D1.toy,phi=phi.fix)





# What are the hyperparameters that were used to create reality?
phi.true.toy(phi=phi.toy)

# 
 computer.model(X=D2.toy,params=theta.toy,draw.from.prior=TRUE,phi=phi.toy)





