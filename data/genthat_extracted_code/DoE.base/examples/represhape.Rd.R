library(DoE.base)


### Name: Reshape designs with repeated measurements
### Title: Reshape designs with repeated measurements
### Aliases: reptowide reptolong
### Keywords: array design

### ** Examples

    ### design without response data
    ### response variable y is added per default
    plan <- oa.design(nlevels=c(2,6,2), replication=2, repeat.only=TRUE)
    pw <- reptowide(plan)  ## make wide
    pl <- reptolong(pw)  ## make long again
    
    ### design with response and further data
    y <- rexp(24)
    temp <- rep(sample(19:30),each=2)  ## constant covariable
    prot.id <- factor(Letters[1:24]) ## non-constant character covariable
    plan.2 <- add.response(plan, y)
    plan.2$temp <- temp     ## not response
    plan.2$prot.id <- prot.id   ##not response
    plan.2
    reptowide(plan.2, constant="temp")



