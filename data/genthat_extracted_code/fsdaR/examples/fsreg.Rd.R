library(fsdaR)


### Name: fsreg
### Title: fsreg: an automatic outlier detection procedure in linear
###   regression
### Aliases: fsreg fsreg.default fsreg.formula print.fsr print.sreg
###   print.mmreg print.fsdalms print.fsdalts print.fsreda print.sregeda
###   print.mmregeda
### Keywords: robust regression

### ** Examples


    n <- 200
    p <- 3
    
    X <- matrix(data=rnorm(n*p), nrow=n, ncol=p)
    y <- matrix(data=rnorm(n*1), nrow=n, ncol=1)
    (out = fsreg(X, y))

    ## Now we use the formula interface:
    (out1 = fsreg(y~X, control=FSR_control(plot=FALSE)))

    ## Or use the variables in a data frame
    (out2 = fsreg(Y~., data=hbk, control=FSR_control(plot=FALSE)))

    ## let us compare to the LTS solution
    (out3 = ltsReg(Y~., data=hbk))
    
    ## Now compute the model without intercept
    (out4 = fsreg(Y~.-1, data=hbk, control=FSR_control(plot=FALSE)))
    
    ## And compare again with the LTS solution
    (out5 = ltsReg(Y~.-1, data=hbk))

    ## using default (optional arguments)        
    (out6 = fsreg(Y~.-1, data=hbk, control=FSR_control(plot=FALSE, nsamp=1500, h=50)))



