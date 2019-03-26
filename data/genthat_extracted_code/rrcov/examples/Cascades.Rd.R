library(rrcov)


### Name: Cascades
### Title: Annual precipitation totals for the North Cascades region
### Aliases: Cascades
### Keywords: datasets

### ** Examples

    data(Cascades)

    # plot a matrix of scatterplots
    pairs(Cascades,
          main="Cascades data set",
          pch=21,
          bg=c("red", "green3", "blue"))

    mcd<-CovMcd(Cascades)
    mcd
    plot(mcd, which="dist", class=TRUE)
    plot(mcd, which="dd", class=TRUE)

    ##  identify the discordant sites using robust distances and compare 
    ##  to the classical ones
    rd <- sqrt(getDistance(mcd))
    ccov <- CovClassic(Cascades)
    cd <- sqrt(getDistance(ccov))
    r.out <- which(rd > sqrt(qchisq(0.975,3)))
    c.out <- which(cd > sqrt(qchisq(0.975,3)))
    cat("Robust: ", length(r.out), " outliers: ", r.out,"\n")
    cat("Classical: ", length(c.out), " outliers: ", c.out,"\n")



