library(groupsubsetselection)


### Name: groupsubsetselection
### Title: Group Subset Selection for Linear Regression
### Aliases: groupsubsetselection

### ** Examples

# Generate some test data.
D <- 100 # Number of observations
N <- 10 # Total number of variables including fixed variables.
x <- matrix(rnorm(D*N),D) # Explanatory variables

# Form 4 groups with 1, 2, 3 and 1 variables in these groups.
ngv <- c(1,2,3,1)

# Number of fixed variables, 3 altogether.
nb <- N - sum(ngv)

# Generate dependent variable randomly.
# It takes group 2 and 4 plus fixed variables, without any constraints on the coefficients.
# So gss should find the combination of groups 2 and 4 with zero rss.
coef <- 1:6
y <- x[,-c(4,7:9)]%*%coef

# Run it and ask for top 2 combinations of up to 2 groups.
res <- groupsubsetselection(y,x,nvarmax=2,nbest=2,nb,consind=rep(0,N),conslb=rep(0,N),ngv)

# Check groups it selects
res$groups

# [1] 2 4 2 4 1 2
 
# The first two groups are the 2 best single groups gss found, the 2nd and 4th respectively.
# The following two combinations, i.e. (2, 4) and (2, 3) are the 2 best combinations of two
# groups gss found. groups 2 and 4 is the best combination of two groups

# Check the RSS
res$rss

# [1] 2326.506 5157.622    0.000 2265.870

# The third entry is the RSS for fitting groups 2 and 4. It is zero apart from numerical error.
# The other fits are much worse.
# 
# Now generate another example where the coefficents contains a negative value. 

coef <- c(rep(1,3),-1,2,3)
y <- x[,-c(4,7:9)]%*%coef

# Run it and ask for top 2 combinations of up to 2 groups, again without any coefficient 
# constraints. 
res <- groupsubsetselection(y,x,nvarmax=2,nbest=2,nb,consind=rep(0,N),conslb=rep(0,N),ngv)

# Check groups it selects

res$groups

# [1] 4 2 2 4 3 4

# It still selects groups 2 and 4 because no constraint has been applied. 
# Now constrain the model so that only positive coefficients for the non-fixed variables 
# are allowed. 

res <- groupsubsetselection(y,x,nvarmax=2,nbest=2,nb,consind=c(rep(0,nb),rep(1,N-nb)),
                            conslb=rep(0,N),ngv)

# Note the consind vector has been changed so that the non-fixed variables must have positive 
# coefficients (specified by conslb). 

# Check groups again

res$groups

# [1] 4 0 1 4 0 0

# Groups 2 and 4 are no longer on the selected list. 
# N.B. Because the samples were randomly generated, the groups selected in run time may be 
# different from those listed above. 
# Zeroes in the list stand for nothing selected for that combination. 




