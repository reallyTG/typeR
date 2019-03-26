library(madsim)


### Name: madsim_test
### Title: A microarray data sample, one colomn numerical values
### Aliases: madsim_test

### ** Examples

    # load a sample of real microarray data
    data(madsim_test)

    # set parameter settings
    mdata <- madsim_test$V1;
    fparams <- data.frame(m1=7, m2=7, shape2=4, lb=4, ub=14, pde=0.02, sym=0.5);
    dparams <- data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
    sdn <- 0.4; rseed <- 50;

    # generate data using microarray as seed
    mydata <- madsim(mdata, n = 10000, ratio = 0, fparams, dparams, sdn, rseed);

    # calculate MMplot variables using samples 1 and 12
    A <- 0.5*(mydata$xdata[,12] + mydata$xdata[,1]);
    M <- mydata$xdata[,12] - mydata$xdata[,1];

    # draw MAplot representation using samples 1 and 12
    plot(A,M)



