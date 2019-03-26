library(SeleMix)


### Name: ml.est
### Title: Fitting Contamination Model
### Aliases: ml.est

### ** Examples


# Parameter estimation with one contaminated variable and one covariate
        data(ex1.data)
        ml.par <- ml.est(y=ex1.data[,"Y1"], x=ex1.data[,"X1"], graph=TRUE) 
        str(ml.par)
        sum(ml.par$outlier)  # number of outliers
# Parameter estimation with two contaminated variables and no covariates
        data(ex2.data)
        par.joint <- ml.est(y=ex2.data, x=NULL, graph=TRUE)  
        sum(par.joint$outlier)  # number of outliers           



