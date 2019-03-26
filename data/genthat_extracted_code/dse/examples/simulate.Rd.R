library(dse)


### Name: simulate
### Title: Simulate a TSmodel
### Aliases: simulate simulate.ARMA simulate.SS simulate.TSestModel
### Keywords: ts

### ** Examples

    mod1 <- ARMA(A=array(c(1,-.25,-.05), c(3,1,1)), B=array(1,c(1,1,1)))
    AR   <- array(c(1, .5, .3, 0, .2, .1, 0, .2, .05, 1, .5, .3) ,c(3,2,2))
    VAR  <- ARMA(A=AR, B=diag(1,2))
    print(VAR)
    simData <- simulate(VAR)

    C    <- array(c(0.5,0,0,0.2),c(1,2,2))
    VARX <- ARMA(A=AR, B=diag(1,2), C=C) 
    simData <- simulate(VARX, sampleT=150, input=matrix(rnorm(300),150,2))

    MA   <- array(c(1, .2, 0, .1, 0, 0, 1, .3), c(2,2,2)) 
    ARMA  <- ARMA(A=AR, B=MA, C=NULL) 
    simData <- simulate(ARMA, sampleT=200)

    ARMAX <- ARMA(A=AR, B=MA, C=C) 
    simData <- simulate(ARMAX, sampleT=150, input=matrix(rnorm(300),150,2))

    data("eg1.DSE.data.diff", package="dse")
    model <- estVARXls(eg1.DSE.data.diff)
    simData <- simulate(model)

    ss <- SS(F=array(c(.5, .3, .2, .4), c(2,2)), 
             H=array(c(1, 0, 0, 1), c(2,2)),
	     K=array(c(.5, .3, .2, .4), c(2,2)))

    print(ss)
    simData <- simulate(ss)

    testEqual(simData, simulate(ss))
    testEqual(simData, simulate(ss, rng=setRNG::getRNG(simData)))

    simData2 <- simulate(ss,
        noise=list(w=matrix(runif(300), 150,2), w0=runif(2)))

    simData3 <- simulate(ss, noise=matrix(runif(400), 200,2))
    


