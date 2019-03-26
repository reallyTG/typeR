library(parsec)


### Name: parsec-package
### Title: PARtial orders in Socio-EConomics
### Aliases: parsec-package parsec
### Keywords: package, poset, partial order, multidimensional poverty,
###   ordinal variables, counting approach, firs order dominance

### ** Examples

###########################################
# a simple example of package application #
###########################################

# definition of the variables by their number of grades
variables <- c(2, 2, 2)

# definition of the threshold
threshold <- c("112", "211")

# extraction of all of the possible profiles from variables; the
# function returns an object of class "wprof", weighted profiles: by default,
# weigths/frequencies are set equal to 1
profiles <- var2prof(varlen = variables)

# the following function creates matrices describing the poset, and
# provides all the results related to it
eval <- evaluation(profiles, threshold, nit = 10^5, maxint = 10^3)

# The results can then be summarized

summary(summary(eval))

# a method of the plot function returns the Hasse diagram, a frequency 
# distribution of the threshold, the identification function, the rank
# distribution of each profile through a barplot, and the relative gap.
plot(eval)

#########################################################
# a second example of new functions recently introduced #
#########################################################

# definition of the variables and of the corresponding profiles
v1 <- as.ordered(c("a", "b", "c", "d"))
v2 <- 1:3
prof <- var2prof(varmod = list(v1 = as.ordered(c("a", "b", "c", "d")), v2 = 1:3))
np <- nrow(prof$profiles)

# definition of different distributions over the set of profiles
k <- 10 # number of populations
set.seed(0)
populations <- as.data.frame(lapply(1:k, function(x) round(runif(np)*100)))
rownames(populations) <- rownames(prof$profiles)
names(populations) <- paste0("P", 1:k)

prof
populations

# evaluation of the fuzzy first order dominance
res <- FFOD(profiles = prof, distributions = populations)
res

# rank stablity analysis
res <- rank_stability(res)
res

# graphical representation
plot(res)



