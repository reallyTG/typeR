library(rabi)


### Name: rs_IDs
### Title: Polynomial color coding scheme generator
### Aliases: rs_IDs

### ** Examples

total.length <- 6  #we have six positions to mark,
redundancy <- 2    #we want surety even with two erasures,
alphabet <- 5      #and we currently have five types of paint in stock

 #This gives a warning because rs_IDs() doesn't
 #allow 'total.length' to be larger than 'alphabet'
codes <- rs_IDs(total.length, redundancy, alphabet)
length(codes)

 #Now the output should be the same as above, but no warning is issued.
codes <- rs_IDs(total.length = 5, redundancy, alphabet)
length(codes)

 #Let's make those into human-readable color sequences
color.names <- c("blue","red","pink-striped-orange", "yellow", "green")
codes_to_colors(codes, color.names)




