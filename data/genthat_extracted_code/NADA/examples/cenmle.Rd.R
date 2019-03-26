library(NADA)


### Name: cenmle
### Title: Regression by Maximum Likelihood Estimation for Left-censored
###   Data
### Aliases: cenmle
### Keywords: survival

### ** Examples


    # Create a MLE regression object 

    data(TCEReg)

    tcemle = with(TCEReg, cenmle(TCEConc, TCECen)) 

    summary(tcemle)
    median(tcemle)
    mean(tcemle)
    sd(tcemle)
    quantile(tcemle)

    # This time specifiy a different confidence interval
    tcemle = with(TCEReg, cenmle(TCEConc, TCECen, conf.int=0.80)) 

    # Use the model's confidence interval with the quantile function
    quantile(tcemle, conf.int=TRUE)

    # With groupings
    with(TCEReg, cenmle(TCEConc, TCECen, PopDensity)) 



