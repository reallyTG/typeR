library(astrochron)


### Name: wtMean
### Title: Ar/Ar Geochronology: calculate weighted mean age, age
###   uncertainty, and other associated statistics/plots (with interactive
###   graphics for data culling).
### Aliases: wtMean

### ** Examples

## No test: 
# Check to see if this is an interactive R session, for compliance with CRAN standards.
# YOU CAN SKIP THE FOLLOWING LINE IF YOU ARE USING AN INTERACTIVE SESSION.
if(interactive()) {

# Sample NE-08-01 Ar/Ar data from Meyers et al. (2012) supplement
age <- c(93.66,94.75,94.6,94.22,86.87,94.64,94.34,94.03,93.56,93.85,88.55,93.45,93.84,
          94.39,94.11,94.48,93.82,93.81,94.18,93.78,94.41,93.49,95.07,94.19)
sd2<- c(5.83,4.10,8.78,2.5,8.86,3.37,4.63,3.18,8.35,5.73,4.23,2.56,2.3,1.7,3.1,2.78,
         1.62,.92,.98,1.41,1.21,1.38,1.48,0.93)
sd <- sd2/2
wtMean(age,sd)

}
## End(No test)



