library(madsim)


### Name: madsim
### Title: Main function of the package "madsim"
### Aliases: madsim

### ** Examples

    # load a sample of real microarray data
    data(madsim_test)

    # set parameters settings
    mdata <- madsim_test$V1;
    fparams <- data.frame(m1 = 7, m2 = 7, shape2 = 4, lb = 4, ub = 14,pde=0.02,sym=0.5);
    dparams <- data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
    sdn <- 0.4; rseed <- 50;

    # generate fully synthetic data
    mydata1 <- madsim(mdata = NULL, n = 10000, ratio = 0, fparams, dparams, sdn, rseed);

    # use true affymetrix data to generate synthetic data
    mydata2 <- madsim(mdata = madsim_test, n=10000, ratio=0,fparams,dparams,sdn,rseed);

    
    A1 <- 0.5*(mydata1$xdata[,12] + mydata1$xdata[,1]);
    M1 <- mydata1$xdata[,12] - mydata1$xdata[,1];

    A2 <- 0.5*(mydata2$xdata[,12] + mydata2$xdata[,1]);
    M2 <- mydata2$xdata[,12] - mydata2$xdata[,1];

    # draw MA plot using samples 1 and 12
    op <- par(mfrow = c())
       plot(A1,M1)
       plot(A2,M2)
    par(op)



