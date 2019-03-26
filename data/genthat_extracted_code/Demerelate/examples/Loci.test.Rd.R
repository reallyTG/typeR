library(Demerelate)


### Name: Loci.test
### Title: Analysis on differences in mean relatedness based on number of
###   loci used for calculations
### Aliases: Loci.test

### ** Examples

     ## Loci.test to analyse Loci distribution in example data

     data(demerelpop)
     demerelpop.sp <- split(demerelpop,demerelpop[,2])
     
     Loci.results <- Loci.test(demerelpop.sp[[1]][,1:8], 
                     ref.pop = "NA", object = TRUE,
                     value = "rxy", bt = 10)  
     
     


