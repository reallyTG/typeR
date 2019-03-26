library(agrmt)


### Name: modes
### Title: Identify multiple modes
### Aliases: modes

### ** Examples

# Example 1: finding the mode
V1 <- c(30,40,210,130,530,50,10)
modes(V1) # will find position 5
# Example 2:
V2 <- c(3,0,4,1)
modes(V2) # will find position 3
# Example 3: providing categories
modes(V2,pos=-1:2) # will still find position 3, but give the value of 1 as mode
# Example 4: similar values
V3 <- c(30,40,500,130,530,50,10) 
modes(V3, tolerance=30) # will find positions 3 and 5 (500 and 530 are nearly the same)



