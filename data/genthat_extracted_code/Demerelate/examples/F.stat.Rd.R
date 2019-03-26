library(Demerelate)


### Name: F.stat
### Title: Head function to calculate F statistics.
### Aliases: F.stat

### ** Examples


        ## Fis statistics are calculated on demerelpop. Weir and Cockerham
        ## and Nei estimates are provided and either written to an object
        ## or to a file.
        ## For end results iteration of 1000 is recommended.


	      data(demerelpop)
	      fstat.results <- F.stat(demerelpop, iteration = 10, 
                                directory.name = "NA", 
                                out.name = "NA")
        
     


