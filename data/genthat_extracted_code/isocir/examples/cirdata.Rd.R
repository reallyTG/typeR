library(isocir)


### Name: cirdata
### Title: Random Circular Data.
### Aliases: cirdata
### Keywords: datasets circular

### ** Examples

data(cirdata)

# Put groups of the order in the correct form:
orderGroups <- c(1,1,1,2,2,3,4,4)


# execute CIRE to obtain the CIRE with circular order:
example1CIRE <- CIRE(cirdata, groups = orderGroups, circular = TRUE)
example1CIRE 

# if the user wants the graphics: 
#plot(example1CIRE)
#plot(example1CIRE, option="cirmeans")






