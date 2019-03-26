library(lfl)


### Name: cbind.fsets
### Title: Combine several 'fsets' objects into a single one
### Aliases: cbind.fsets
### Keywords: models robust

### ** Examples

    d1 <- lcut3(CO2[, 1:2])
    d2 <- lcut3(CO2[, 3:4])
    r <- cbind(d1, d2)

    print(colnames(d1))
    print(colnames(d2))
    print(colnames(r))

    print(vars(d1))
    print(vars(d2))
    print(vars(r))

    print(specs(d1))
    print(specs(d2))
    print(specs(r))



