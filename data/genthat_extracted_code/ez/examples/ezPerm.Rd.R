library(ez)


### Name: ezPerm
### Title: Perform a factorial permutation test
### Aliases: ezPerm

### ** Examples

library(plyr)
#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)
ezPrecis(ANT)

#Compute some useful statistics per cell.
cell_stats = ddply(
    .data = ANT
    , .variables = .( subnum , group , cue , flank )
    , .fun = function(x){
        #Compute error rate as percent.
        error_rate = mean(x$error)*100
        #Compute mean RT (only accurate trials).
        mean_rt = mean(x$rt[x$error==0])
        #Compute SD RT (only accurate trials).
        sd_rt = sd(x$rt[x$error==0])
        to_return = data.frame(
            error_rate = error_rate
            , mean_rt = mean_rt
            , sd_rt = sd_rt
        )
        return(to_return)
    }
)

#Compute the grand mean RT per Ss.
gmrt = ddply(
    .data = cell_stats
    , .variables = .( subnum , group )
    , .fun = function(x){
        to_return = data.frame(
            mrt = mean(x$mean_rt)
        )
        return(to_return)
    }
)

#Run a purely between-Ss permutation test on the mean_rt data.
mean_rt_perm = ezPerm(
    data = gmrt
    , dv = mrt
    , wid = subnum
    , between = group
    , perms = 1e1 #1e3 or higher is best for publication
)

#Show the Permutation test.
print(mean_rt_perm)



