library(rrcov)


### Name: lmom33
### Title: Hosking and Wallis Data Set, Table 3.3
### Aliases: lmom33
### Keywords: datasets

### ** Examples

    data(lmom33)

    # plot a matrix of scatterplots
    pairs(lmom33,
          main="Hosking and Wallis Data Set, Table 3.3",
          pch=21,
          bg=c("red", "green3", "blue"))

    mcd<-CovMcd(lmom33)
    mcd
    plot(mcd, which="dist", class=TRUE)
    plot(mcd, which="dd", class=TRUE)

    ##  identify the discordant sites using robust distances and compare 
    ##  to the classical ones
    mcd <- CovMcd(lmom33)
    rd <- sqrt(getDistance(mcd))
    ccov <- CovClassic(lmom33)
    cd <- sqrt(getDistance(ccov))
    r.out <- which(rd > sqrt(qchisq(0.975,3)))
    c.out <- which(cd > sqrt(qchisq(0.975,3)))
    cat("Robust: ", length(r.out), " outliers: ", r.out,"\n")
    cat("Classical: ", length(c.out), " outliers: ", c.out,"\n")




