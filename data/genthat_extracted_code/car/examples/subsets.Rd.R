library(car)


### Name: subsets
### Title: Plot Output from regsubsets Function in leaps package
### Aliases: subsets subsets.regsubsets
### Keywords: hplot regression

### ** Examples

if (require(leaps)){
    subsets(regsubsets(undercount ~ ., data=Ericksen),
            legend=c(3.5, -37))
}



