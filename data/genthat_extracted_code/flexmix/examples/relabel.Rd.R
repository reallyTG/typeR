library(flexmix)


### Name: relabel
### Title: Relabel the Components
### Aliases: relabel relabel,FLXdist,missing-method
###   relabel,FLXdist,character-method relabel,FLXdist,integer-method
### Keywords: methods

### ** Examples

    set.seed(123)
    beta <- matrix(1:16, ncol = 4)
    beta
    df1 <- ExLinear(beta, n = 100, sd = .5)
    f1 <- flexmix(y~., data = df1, k = 4)

    ## There was label switching, parameters are not in the same order
    ## as in beta:
    round(parameters(f1))
        
    betas <- rbind(beta, .5)
    betas

    ## This makes no sense:
    summary(abs(as.vector(betas-parameters(f1))))

    ## We relabel the components by sorting the coefficients of x1:
    r1 <- relabel(f1, by = "model", which = "x1")
    round(parameters(r1))

    ## Now we can easily compare the fit with the true parameters:
    summary(abs(as.vector(betas-parameters(r1))))



