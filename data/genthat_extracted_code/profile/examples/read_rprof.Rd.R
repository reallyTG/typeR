library(profile)


### Name: read_rprof
### Title: File I/O for profiler data
### Aliases: read_rprof read_pprof write_rprof write_pprof

### ** Examples

rprof_file <- system.file("samples/rprof/1.out", package = "profile")
ds <- read_rprof(rprof_file)
ds
pprof_file <- tempfile("profile", fileext = ".pb.gz")
write_pprof(ds, pprof_file)



