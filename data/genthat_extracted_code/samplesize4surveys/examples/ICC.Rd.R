library(samplesize4surveys)


### Name: ICC
### Title: Intraclass Correlation Coefficient
### Aliases: ICC

### ** Examples


##########################################
# Almost same mean in each cluster       #
#                                        #
# - Heterogeneity within clusters        #
# - Homogeinity between clusters         #
##########################################

# Population size
N <- 100000
# Number of clusters in the population
NI <- 1000
# Number of elements per cluster
N/NI

# The variable of interest
y <- c(1:N)
# The clustering factor
cl <- rep(1:NI, length.out=N)

table(cl)
tapply(y, cl, FUN=mean)
boxplot(y~cl)
rho = ICC(y,cl)$ICC
rho


##########################################
# Very different means per cluster       #
#                                        #
# - Heterogeneity between clusters       #
# - Homogeinity within clusters          #
##########################################

# Population size
N <- 100000
# Number of clusters in the population
NI <- 1000
# Number of elements per cluster
N/NI

# The variable of interest
y <- c(1:N)
# The clustering factor
cl <- kronecker(c(1:NI),rep(1,N/NI))

table(cl)
tapply(y, cl, FUN=mean)
boxplot(y~cl)
rho = ICC(y,cl)$ICC
rho

############################
# Example 1 with Lucy data #
############################

data(Lucy)
attach(Lucy)
N <- nrow(Lucy)
y <- Income
cl <- Zone
ICC(y,cl)

############################
# Example 2 with Lucy data #
############################

data(Lucy)
attach(Lucy)
N <- nrow(Lucy)
y <- as.double(SPAM)
cl <- Zone
ICC(y,cl)



