library(rabi)


### Name: how_robust
### Title: Quick method to see how robust a list of ID codes is to erasures
### Aliases: how_robust

### ** Examples

 #Let's generate some unique IDs given:
total.length <- 4  #we have four positions to mark,
redundancy <- 2    #we're interested in being robust to two erasures,
alphabet <- 5      #and we currently have five types of color bands in stock

codes <- rs_IDs(total.length, redundancy, alphabet)
 #Given that we specified a robustness of 2,
 #there should be no counts of "dist.2" or lower
how_robust(codes)





