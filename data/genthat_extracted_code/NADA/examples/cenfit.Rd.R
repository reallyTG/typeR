library(NADA)


### Name: cenfit
### Title: Compute an ECDF for Censored Data
### Aliases: cenfit
### Keywords: survival

### ** Examples


    # Create a Kaplan-Meier ECDF, plot and summarize it.

    data(Cadmium)

    obs      = Cadmium$Cd
    censored = Cadmium$CdCen

    mycenfit = cenfit(obs, censored) 

    plot(mycenfit)
    summary(mycenfit)
    quantile(mycenfit, conf.int=TRUE)
    median(mycenfit)
    mean(mycenfit)
    sd(mycenfit)
    predict(mycenfit, c(10, 20, 100), conf.int=TRUE)

    # With groups
    groups = Cadmium$Region

    cenfit(obs, censored, groups)
    
    # Formula interface -- no groups
    cenfit(Cen(obs, censored)) 

    # Formula interface -- with groups
    cenfit(Cen(obs, censored)~groups) 



