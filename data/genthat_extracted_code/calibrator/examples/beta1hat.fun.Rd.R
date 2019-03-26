library(calibrator)


### Name: beta1hat.fun
### Title: beta1 estimator
### Aliases: beta1hat.fun
### Keywords: array

### ** Examples

data(toys)
y.toy <- create.new.toy.datasets(D1=D1.toy , D2=D2.toy)$y.toy
beta1hat.fun(D1=D1.toy, H1=H1.toy, y=y.toy, phi=phi.toy)

      # now cheat: force the hyperparameters to have the correct psi1:
 phi.fix <- phi.change(old.phi=phi.toy,psi1=c(1, 0.5, 1.0, 1.0, 0.5, 0.4),phi.fun=phi.fun.toy)
      # The value for psi1 is obtained by cheating and #examining the source
      # code for computer.model(); see ?phi.change 


      # Create a new toy dataset with 40 observations:
D1.big <- latin.hypercube(40,5)

jj <- create.new.toy.datasets(D1=D1.big , D2=D2.toy)

      # We know that the real coefficients are 4:9 because we
      # we can cheat and look at the source code for computer.model()

      # Now estimate the coefficients without cheating:

beta1hat.fun(D1=D1.big, H1=H1.toy, jj$y, phi=phi.toy)

     # Not bad!



     # We can do slightly better by cheating and using the
     # correct value for the hyperparameters:

beta1hat.fun(D1=D1.big, H1=H1.toy, jj$y,phi=phi.true.toy(phi=phi.toy))

     #marginally worse.





