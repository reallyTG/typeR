library(dr4pl)


### Name: gof.dr4pl
### Title: Perform the goodness-of-fit (gof) test for the 4PL model.
### Aliases: gof.dr4pl

### ** Examples

obj.dr4pl <- dr4pl(Response ~ Dose, data = sample_data_4)  # Fit a 4PL model to data
gof.dr4pl(obj.dr4pl)  # Print the goodness-of-fit test results




