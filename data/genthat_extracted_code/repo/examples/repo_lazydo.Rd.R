library(repo)


### Name: repo_lazydo
### Title: Run expression with cache.
### Aliases: repo_lazydo

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)


## First run
system.time(rp$lazydo(
    {
        Sys.sleep(1/10)
        x <- 10
    }
))

## lazydo is building resource from code.
## Cached item name is: f3c27f11f99dce20919976701d921c62
##   user  system elapsed 
##  0.004   0.000   0.108 

## Second run
system.time(rp$lazydo(
    {
        Sys.sleep(1/10)
        x <- 10
    }
))

## lazydo found precomputed resource.
##   user  system elapsed 
##  0.001   0.000   0.001 


## The item's name in the repo can be obtained as the name of the
## last item added:

l <- length(rp$entries())
resname <- rp$entries()[[l]]$name
cat(rp$entries()[[l]]$description)
## {
##    Sys.sleep(1/10)
##    x <- 10
## }
rp$rm(resname) ## single cached item cleared

## wiping temporary repo
unlink(rp_path, TRUE)



