library(ncappc)


### Name: ncappc
### Title: Performs NCA calculations and population PK model diagnosis.
### Aliases: ncappc

### ** Examples

out <- ncappc(obsFile=system.file("extdata","pkdata.csv",package="ncappc"), 
  onlyNCA = TRUE,
  extrapolate = TRUE,
  printOut = FALSE,
  evid = FALSE,
  psnOut=FALSE)
  

data_1 <- data.frame(
  ID=1,
  TIME = c(0,0.25,0.5,1,1.5,2,3,4,6,8,12,16,24),
  DV=c(0, 0.07, 0.14, 0.21, 0.24, 0.27, 0.26, 0.25, 0.22, 0.19, 0.13, 0.081, 0.033)
)
out_1 <- ncappc(obsFile=data_1,
                onlyNCA = TRUE,
                extrapolate = TRUE,
                printOut = FALSE,
                evid = FALSE,
                timing=TRUE)


data_2 <- dplyr::filter(data_1,TIME>17|TIME<3)
out_2 <- ncappc(obsFile=data_2,
                onlyNCA = TRUE,
                extrapolate = TRUE,
                printOut = FALSE,
                evid = FALSE,
                force_extrapolate=TRUE)




