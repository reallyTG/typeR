library(prrd)


### Name: enqueueJobs
### Title: Enqueues reverse-dependent packages
### Aliases: enqueueJobs enqueueDepends

### ** Examples

td <- tempdir()
options(repos=c(CRAN="https://cloud.r-project.org"))
jobsdf <- enqueueJobs(package="digest", directory=td)



