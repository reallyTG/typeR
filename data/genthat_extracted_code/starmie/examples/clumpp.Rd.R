library(starmie)


### Name: clumpp
### Title: Run the CLUMPP algorithms.
### Aliases: clumpp

### ** Examples

# use multiple K=3 runs
cl_data <- exampleStructure("clumpp")
print(cl_data)
Q_list <- lapply(cl_data, getQ)
clumppy <- clumpp(Q_list)



