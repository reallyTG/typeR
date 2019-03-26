library(rabi)


### Name: simple_IDs
### Title: Simple color coding scheme generator
### Aliases: simple_IDs

### ** Examples

total.length <- 4  #we have four positions to mark
alphabet <- 5      #and we currently have five types of paint in stock

 #Generate codes where the sum of the sequence is a multiple of five
simple_IDs(total.length, alphabet)

 #Let's make those into human-readable color sequences
color.names <- c("blue","red","green","pink","cyan")
simple_IDs(total.length, alphabet, available.colors = color.names)




