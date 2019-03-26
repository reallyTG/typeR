library(unix)


### Name: rlimit
### Title: Resource Limits
### Aliases: rlimit rlimit_all rlimit_as rlimit_core rlimit_cpu rlimit_data
###   rlimit_fsize rlimit_memlock rlimit_nofile rlimit_nproc rlimit_stack

### ** Examples

# Print all limits
rlimit_all()

# Get one limit
rlimit_as()

# Set a soft limit
lim <- rlimit_as(1e9)
print(lim)

# Reset the limit to max
rlimit_as(cur = lim$max)

## Not run: 
##D # Set a hard limit (irreversible)
##D rlimit_as(max = 1e10)
## End(Not run)



