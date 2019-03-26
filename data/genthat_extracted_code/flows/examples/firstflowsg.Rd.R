library(flows)


### Name: firstflowsg
### Title: Flow Selection Based on Global Criteria
### Aliases: firstflowsg

### ** Examples

# Import data
data(nav)
myflows <- prepflows(mat = nav, i = "i", j = "j", fij = "fij")

# Remove the matrix diagonal
diag(myflows) <- 0

# Select the 50 first flows of the matrix
flowSel <- firstflowsg(mat = myflows, method = "nfirst", ties.method = "first",
                       k = 50)
statmat(mat = myflows * flowSel, output = "none")

# Select all flows greater than 2000
flowSel <- firstflowsg(myflows, method = "xfirst", k= 2000)
statmat(mat = myflows * flowSel, output = "none")

# Select flows that represent at least 50% of the matrix flows
k50 <- sum(myflows)/2
flowSel <- firstflowsg(mat = myflows, method = "xsumfirst", k = 150000)
statmat(mat = myflows * flowSel, output = "none")



