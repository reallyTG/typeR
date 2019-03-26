library(preputils)


### Name: rmbat
### Title: batch effect removal by mean centering and shifting
### Aliases: rmbat

### ** Examples

    # create data set
    n_obs = 8
    n_var = 10
    predictor <- rep(0:1,n_obs*0.5)
    pure_effect <- outer(rnorm(n_var),predictor)
    error <- matrix(rnorm(n_var*n_obs),n_var,n_obs)
    batch1 <- rep(1:2,each=n_obs*0.5)
    batch2 <- rep(c(1,2,1,2),each=n_obs*0.25)
    batch_effect1 <- outer(rnorm(n_var)*2,scale(batch1))[,,1]
    batch_effect2 <- outer(rnorm(n_var)*4,scale(batch2))[,,1]
    batch_effect <- batch_effect1 + batch_effect2
    data_measured <- pure_effect + batch_effect + error
    
    zero = outer(rep(0,n_var),rep(0,n_obs))
    b1 <- rmbat(batch_effect1,batch1)
    b2 <- rmbat(batch_effect2,batch2)
    b12a <- rmbat(batch_effect1,paste(batch1,batch2))
    b12b <- batch_effect 
    all.equal(b1,zero)
    all.equal(b2,zero)
    all.equal(b12a,zero)
    all.equal(b12b,zero)



