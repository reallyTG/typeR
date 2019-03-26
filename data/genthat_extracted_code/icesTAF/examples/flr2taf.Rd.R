library(icesTAF)


### Name: flr2taf
### Title: Convert FLR Table to TAF Format
### Aliases: flr2taf

### ** Examples

x <- array(t(catage.xtab), dim=c(4,8,1,1,1,1))
dimnames(x) <- list(age=1:4, year=1963:1970,
                    unit="unique", season="all", area="unique", iter=1)
flr2taf(x)

x1 <- x[1,,,,,,drop=FALSE]
flr2taf(x1)
flr2taf(x1, "Juveniles")



