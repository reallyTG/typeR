library(preputils)


### Name: m2beta
### Title: Convert logit transformed M-Values of proportional data back to
###   original 0/1 range
### Aliases: m2beta

### ** Examples

    b = 1:99 / 100
    M = beta2m(b)
    plot(b,m2beta(M))
    print(all.equal(b, m2beta(M)))



