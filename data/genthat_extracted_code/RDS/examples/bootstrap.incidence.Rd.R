library(RDS)


### Name: bootstrap.incidence
### Title: Calculates incidence and bootstrap confidence intervals for
###   immunoassay data collected with RDS
### Aliases: bootstrap.incidence

### ** Examples

data(faux)
faux$hiv <- faux$X == "blue"
faux$recent <- NA
faux$recent[faux$hiv] <- runif(sum(faux$hiv)) < .2
faux$recent[runif(nrow(faux)) > .5] <- NA
faux$hiv[is.na(faux$recent)][c(1,6,10,21)] <- NA
attr(faux,"time") <- "wave"
bootstrap.incidence(faux,"recent","hiv",weight.type="RDS-II", number.of.bootstrap.samples=100)



