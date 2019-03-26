library(psychometric)


### Name: psychometric-package
### Title: Applied Psychometric Theory
### Aliases: psychometric-package psychometric apt
### Keywords: package

### ** Examples

# Convert Pearson r to Fisher z'
r2z (.51)
# Convert Fisher z' to r
z2r (.563)

# Construct a CI about a True Score
# Observed = 700, Test Ave. = 500, SD = 100, and reliability = .9
CI.tscore (700, 500, 100, .9)

# Compute the classical utility of a test
# Assuming base-rate = .5, selection ratio = .5 and rxy = .5
ClassUtil(rxy=.5, BR=.5, SR=.5)

# Examine test score items
data(TestScores)
item.exam(TestScores[,1:10], y = TestScores[,11], discrim=TRUE)




