library(rabi)


### Name: codes_to_colors
### Title: Converting numeric ID codes to listed color name codes
### Aliases: codes_to_colors

### ** Examples

total.length <- 3  #we have three positions to mark,
redundancy <- 1    #we want codes robust to a single erasure,
alphabet <- 3      #and we currently have three types of paint in stock

 #Create a list of codes
codes <- rs_IDs(total.length, redundancy, alphabet)

 #Let's make those into human-readable color sequences
color.names <- c("blue","red","pink-striped-orange")
codes_to_colors(codes, color.names)

 #We can also skip the whole function and plug the names straight into the code generator
rs_IDs(total.length, redundancy, alphabet, available.colors = color.names)





