library(rbi)


### Name: attach_data
### Title: Attach a new file or data set to a 'libbi' object
### Aliases: attach_data attach_data.libbi

### ** Examples

bi <- libbi(model = system.file(package="rbi", "PZ.bi"))
example_output <- bi_read(system.file(package="rbi", "example_output.nc"))
bi <- attach_data(bi, "output", example_output)



