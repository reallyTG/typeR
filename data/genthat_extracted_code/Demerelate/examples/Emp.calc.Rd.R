library(Demerelate)


### Name: Emp.calc
### Title: Function to calculate pairwise relatedness within populations
###   based on allele sharing.
### Aliases: Emp.calc

### ** Examples

     ## demerelpop needs to be an object of class data.frame formatted
     ## according to inputformat. For each pairwise comparison in
     ## in the data.frame empirical estimates of relatedness are
     ## calculated omitting statistics.

      data(demerelpop)
      
      # As example Mxy is calculated for one population of demerelpop
      
      demerelpop.sp <- split(demerelpop,demerelpop[,2])

      empirical.result <- Emp.calc(demerelpop.sp[[1]], value="Mxy", 
                                   ref.pop="NA")
    
     
     


