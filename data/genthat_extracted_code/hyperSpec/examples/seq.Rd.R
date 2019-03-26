library(hyperSpec)


### Name: seq.hyperSpec
### Title: Sequence generation along spectra or wavelengths This function
###   generates sequences along the spectra (rows) or wavelengths of
###   hyperSpec objects.
### Aliases: seq.hyperSpec seq seq,hyperSpec-method
### Keywords: manip

### ** Examples


seq (flu, index = TRUE)
seq_along (flu)
seq (flu, length.out = 3, index = TRUE) # return value is numeric, not integer! 
seq (flu, by = 2, index = TRUE) 		    # return value is numeric, not integer! 

plot (flu, col = "darkgray") 
plot (seq (flu, by = 2), add = TRUE, col= "red")
plot (seq (flu, length.out = 2), add = TRUE, col= "blue")




