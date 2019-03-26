library(flows)


### Name: firstflows
### Title: Flow Selection from Origins
### Aliases: firstflows

### ** Examples

# Import data
data(nav)
myflows <- prepflows(mat = nav, i = "i", j = "j", fij = "fij")

# Remove the matrix diagonal
diag(myflows) <- 0

# Select the 2 first flows of each origin
flowSel <- firstflows(mat = myflows, method = "nfirst", ties.method = "first",
                      k = 2)
statmat(mat = myflows * flowSel, output = "none")

# Select flows greater than 2000
flowSel <- firstflows(mat = myflows, method = "xfirst", k = 2000)
statmat(mat = myflows * flowSel, output = "none")

# Select as many flows as necessary for each origin so that their sum is at
# least equal to 20000
flowSel <- firstflows(myflows, method = "xsumfirst", k = 20000)
statmat(mat = myflows * flowSel, output = "none")

# Select each flows that represent at least 10% of the outputs
myflowspct <- myflows / rowSums(myflows) * 100
flowSel <- firstflows(mat = myflowspct, method = "xfirst", k = 10)
statmat(mat = myflows * flowSel, output = "none")



