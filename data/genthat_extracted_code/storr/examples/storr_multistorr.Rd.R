library(storr)


### Name: storr_multistorr
### Title: Storr with multiple storage drivers
### Aliases: storr_multistorr

### ** Examples

# Create a storr that is stores keys in an environment and data in
# an rds
path <- tempfile()
st <- storr::storr_multistorr(driver_environment(),
                              driver_rds(path))
st$set("a", runif(10))
st$get("a")

# The data can be also seen by connecting to the rds store
rds <- storr::storr_rds(path)
rds$list() # empty
rds$list_hashes() # here's the data
rds$get_value(rds$list_hashes())

st$destroy()



