library(astrochron)


### Name: stepHeat
### Title: Ar/Ar Geochronology: Generate an Ar/Ar age spectrum and
###   calculate step-heating plateau age.
### Aliases: stepHeat

### ** Examples

## No test: 
# Check to see if this is an interactive R session, for compliance with CRAN standards.
# YOU CAN SKIP THE FOLLOWING LINE IF YOU ARE USING AN INTERACTIVE SESSION.
if(interactive()) {

# Sample MT-09-09 incremental heating Ar/Ar data from Sageman et al. (2014).
perAr39 <- c(4.96,27.58,19.68,39.9,6.25,1.02,0.42,0.19)
age <- c(90.08,89.77,89.92,89.95,89.89,89.55,87.71,86.13)
sd <- c(0.18,0.11,0.08,0.06,0.14,0.64,1.5,3.22)
KCa <- c(113,138,101,195,307,27,17,24)
perAr40 <- c(93.42,99.42,99.64,99.79,99.61,97.99,94.64,90.35)
Fval <- c(2.148234,2.140643,2.144197,2.145006,2.143627,2.135163,2.090196,2.051682)
Fsd <- c(0.00439,0.00270,0.00192,0.00149,0.00331,0.01557,0.03664,0.07846)
ex <- data.frame(cbind(perAr39,age,sd,KCa,perAr40,Fval,Fsd))

stepHeat(ex)

# plot without points identified
stepHeat(ex,size=0,idPts=FALSE,cull=0)

}
## End(No test)



