library(samplesize4surveys)


### Name: ss4pH
### Title: The required sample size for testing a null hyphotesis for a
###   single proportion
### Aliases: ss4pH

### ** Examples

ss4pH(N = 10000, p = 0.5, p0 = 0.55)
ss4pH(N = 10000, p = 0.5, p0 = 0.55, plot=TRUE)
ss4pH(N = 10000, p = 0.5, p0 = 0.55, DEFF = 2, plot=TRUE)
ss4pH(N = 10000, p = 0.5, p0 = 0.55, conf = 0.99, power = 0.9, DEFF = 2, plot=TRUE)

#############################
# Example with BigLucy data #
#############################
data(BigLucy)
attach(BigLucy)

N <- nrow(BigLucy)
p <- prop.table(table(SPAM))[1]

# The minimum sample size for testing 
# H_0: P - P_0 = 0   vs.   H_a: P - P_0 = D = 0.1
D = 0.1 
p0 = p - D 
ss4pH(N, p, p0, conf = 0.99, power = 0.9, DEFF = 2, plot=TRUE)

# The minimum sample size for testing 
# H_0: P - P_0 = 0   vs.   H_a: P - P_0 = D = 0.02
D = 0.02
p0 = p - D 
ss4pH(N, p, p0, conf = 0.99, power = 0.9, DEFF = 3.45, plot=TRUE)



