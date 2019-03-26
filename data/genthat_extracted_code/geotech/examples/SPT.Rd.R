library(geotech)


### Name: SPT
### Title: Standard Penetration Test (SPT) Corrected N-values
### Aliases: SPT N60 N160

### ** Examples


##  Example code for SPT blow count (N-value) corrected for field
##  procedures
N60(N = 11, Lr = 25, Db = 4, E = 0.50, SS = TRUE, metric = FALSE)

##  Example code for SPT blow count (N-value) corrected for field
##  procedures and overburden pressure
##  In English units
N160(N60 = 8, sigma = 1500, metric = FALSE)
##  In SI units
N160(N60 = 8, sigma = 90, metric = TRUE)



