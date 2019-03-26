library(Luminescence)


### Name: convert_Activity2Concentration
### Title: Convert Nuclide Activities to Concentrations and Vice Versa
### Aliases: convert_Activity2Concentration
### Keywords: IO

### ** Examples


##construct data.frame
data <- data.frame(
 NUCLIDES = c("U-238", "Th-232", "K-40"),
 VALUE = c(40,80,100),
 VALUE_ERROR = c(4,8,10),
 stringsAsFactors = FALSE)

##perform analysis
convert_Activity2Concentration(data)




