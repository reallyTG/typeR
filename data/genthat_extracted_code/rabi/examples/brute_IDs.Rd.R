library(rabi)


### Name: brute_IDs
### Title: Brute force color coding scheme generator
### Aliases: brute_IDs

### ** Examples

total.length <- 6  #we have six positions to mark,
redundancy <- 2    #we want surety even with two erasures,
alphabet <- 5      #and we currently have five types of paint in stock

 #This gives a warning because rs_IDs() doesn't
 #allow 'total.length' to be larger than 'alphabet'
codes <- rs_IDs(total.length, redundancy, alphabet)
length(codes)

 #However, we can do it with brute_IDs() to get more unique IDs
codes <- brute_IDs(total.length, redundancy, alphabet, num.tries = 1)
length(codes)

 #Let's make those into human-readable color sequences
color.names <- c("blue","red","green","pink","yellow-with-a-stripe")
color.codes <- codes_to_colors(codes, color.names)






