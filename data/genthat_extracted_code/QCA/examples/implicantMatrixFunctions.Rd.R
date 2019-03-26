library(QCA)


### Name: Implicant matrix functions: allExpressions, createMatrix, getRow
### Title: Functions Related to the Implicant Matrix
### Aliases: allExpressions createMatrix getRow
### Keywords: functions

### ** Examples

# three binary causal conditions, having two levels each: 0 and 1=
noflevels <- c(2, 2, 2)


# for three binary causal conditions
allExpressions(noflevels)

# the same matrix, this time arranged better
# (last rows represent the truth table)
allExpressions(noflevels, arrange = TRUE)

# show only the implicants (excluding the truth table)
allExpressions(noflevels, arrange = TRUE, depth = 2)

# using the raw form
allExpressions(noflevels, raw = TRUE)


# create a base truth table for 3 binary conditions
createMatrix(noflevels)

# its implicant matrix
createMatrix(noflevels + 1)

# create a base truth table where the second condition has three levels
createMatrix(c(2, 3, 2))



# deriving rows
rows <- c(2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17)
mat <- getRow(rows, noflevels + 1) # note the +1
rownames(mat) <- rows
colnames(mat) <- c("A", "B", "C")
mat

# implicant matrix     normal values
# 
#       A  B  C    |       A  B  C       
#    2  0  0  1    |    2  -  -  0       c      
#    4  0  1  0    |    4  -  0  -       b
#    5  0  1  1    |    5  -  0  0       bc
#    7  0  2  0    |    7  -  1  -       B
#    8  0  2  1    |    8  -  1  0       Bc
#   10  1  0  0    |   10  0  -  -       a  
#   11  1  0  1    |   11  0  -  0       ac                 
#   13  1  1  0    |   13  0  0  -       ab   
#   14  1  1  1    |   14  0  0  0       abc
#   16  1  2  0    |   16  0  1  -       aB
#   17  1  2  1    |   17  0  1  0       aBc                   



