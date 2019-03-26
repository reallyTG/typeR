library(rrcov)


### Name: Appalachia
### Title: Annual maximum streamflow in central Appalachia
### Aliases: Appalachia
### Keywords: datasets

### ** Examples

    data(Appalachia)

    # plot a matrix of scatterplots
    pairs(Appalachia,
          main="Appalachia data set",
          pch=21,
          bg=c("red", "green3", "blue"))

    mcd<-CovMcd(Appalachia)
    mcd
    plot(mcd, which="dist", class=TRUE)
    plot(mcd, which="dd", class=TRUE)

    ##  identify the discordant sites using robust distances and compare 
    ##  to the classical ones
    mcd <- CovMcd(Appalachia)
    rd <- sqrt(getDistance(mcd))
    ccov <- CovClassic(Appalachia)
    cd <- sqrt(getDistance(ccov))
    r.out <- which(rd > sqrt(qchisq(0.975,3)))
    c.out <- which(cd > sqrt(qchisq(0.975,3)))
    cat("Robust: ", length(r.out), " outliers: ", r.out,"\n")
    cat("Classical: ", length(c.out), " outliers: ", c.out,"\n")



