
# simulation example for estimating covariance
# LatticeKrig
# Copyright 2004-2016, Institute for Mathematics Applied Geosciences
# University Corporation for Atmospheric Research
# Licensed under the GPL -- www.gpl.org/licenses/gpl.html

suppressMessages(library(LatticeKrig))
options(echo = FALSE)
test.for.zero.flag <- 1

# NOTE: these tests also exercise the LKinfoUpdate function which is complex and 
# has many potential places for creative bugs!

tick<- Sys.time()

set.seed( 122)

# most of these test are predicated on the replications (M) overwhelming sampling error to 
# give the expected estiamtes ....  

M<- 1e3 # nummber of independent spatial replications
N<- 40 # number of obs
x<- matrix( runif(2*N ), N,2)
lambdaTrue<- .1^2
#NOTE: true rho is 1.0 dont add fixed function so likelihood is precise.
LKinfoTrue<- LKrigSetup(x,NC=3, nlevel=2, a.wght= 4.2,
                        alpha=c(1.0,.5), lambda=lambdaTrue,
                        normalize=FALSE, NC.buffer=2, fixedFunction = NULL)
f<- LKrig.sim( x, LKinfoTrue, M=M) 
E<- matrix( rnorm( prod( dim( f))), nrow= nrow( f), ncol=ncol(f) )
Y<- f + sqrt(lambdaTrue)* E

LKinfoTest<- LKinfoUpdate( LKinfoTrue, a.wght=4.3,
                         lambda=lambdaTrue*(1.05))

Fit1<- LKrigFindLambdaAwght( x,Y,LKinfo=LKinfoTest,
                             verbose=FALSE,  pgtol=1e+1)
# now try this with collapsed fixed effects -- results should be close
LKinfo2<- LKrigSetup(x,NC=3, nlevel=2,
                         a.wght=4.3,
                         lambda=lambdaTrue*(1.05), 
                         alpha=c(1.0,.5), 
                         normalize=FALSE, NC.buffer=2, 
                     collapseFixedEffect = TRUE)
Fit2<- LKrigFindLambdaAwght( x,Y, LKinfo=LKinfo2,
                             verbose=FALSE,  pgtol=1e+1)
LKinfo3<- LKinfoUpdate(LKinfo2, collapseFixedEffect = FALSE,
                       a.wght=5)

Fit3<- LKrigFindLambdaAwght( x,Y, LKinfo=LKinfo3,
                             verbose=FALSE,  pgtol=.8)
print(signif(Fit1$summary,4))
print(signif(Fit2$summary,4))
print(signif(Fit3$summary,4))



##plot( log10(Fit1$lnLike.eval[,1]), Fit1$lnLike.eval[,5], xlim=c(-3,-1.5), ylim=c(328000,339000))
#points( log10(Fit1$lambda.MLE),Fit1$summary["lnProfLike"], col="red")

#plot( log10(Fit2$lnLike.eval[,1]), Fit2$lnLike.eval[,4], xlim=c(-3,-1.5), ylim=c(328000,339000))
#points( log10(Fit2$lambda.MLE),Fit2$summary["lnProfLike"], col="red")

# check that MLE really is MLE when refining over lambda 
LKinfoTest2<- LKinfoUpdate(LKinfoTest, a.wght= Fit1$a.wght.MLE,
                           lambda=Fit1$lambda.MLE )
Fit2<- LKrigFindLambda( x,Y,LKinfo=LKinfoTest2)
signif( Fit2$summary, 4)
signif(Fit2$lambda.MLE, 4)

test.for.zero( Fit2$summary["lnProfLike"],
               Fit1$summary["lnProfLike"], tol=5e-3, tag=" log Like lambda MLE")

# Monte Carlo test that parameters  are estimated correctly
set.seed(223)
M<- 1e2 # nummber of independent spatial replications
N<- 100 # number of obs
x<- matrix( runif(2*N ), N,2)
lambdaTrue<- .05^2
#NOTE: true rho is 1.0
LKinfoTrue<- LKrigSetup(x,NC=3, nlevel=2, a.wght= 4.2,
                        alpha=c(1.0,.5), lambda=lambdaTrue,
                        normalize=FALSE, NC.buffer=2,fixedFunction = NULL )
f<- LKrig.sim( x, LKinfoTrue, M=M) 
E<- matrix( rnorm( prod( dim( f))), nrow= nrow( f), ncol=ncol(f) )
Y<- f + sqrt(lambdaTrue)* E

LKinfoTest<- LKinfoUpdate( LKinfoTrue, a.wght=4.3,
                           lambda=lambdaTrue*(1.1))


Fit1<- LKrigFindLambdaAwght( x,Y,LKinfo=LKinfoTest,
                             verbose=FALSE, pgtol=5e+0)
print(signif(Fit1$summary,4))

tock<- Sys.time()
#print( tock - tick)

test.for.zero( Fit1$summary["a.wght.MLE"], 4.2, tol=.02)
test.for.zero( Fit1$summary["lambda.MLE"], lambdaTrue, tol=.01)


