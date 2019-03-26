library(profileR)


### Name: pbg
### Title: Profile Analysis by Group: Testing Parallelism, Equal Levels,
###   and Flatness
### Aliases: pbg

### ** Examples

## Not run: 
##D data(spouse)
##D mod <- pbg(data=spouse[,1:4], group=spouse[,5], original.names=TRUE, profile.plot=TRUE)
##D print(mod) #prints average scores in the profile across two groups
##D summary(mod) #prints the results of three profile by group hypothesis tests
## End(Not run)



