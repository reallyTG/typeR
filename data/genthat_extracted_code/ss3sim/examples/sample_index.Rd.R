library(ss3sim)


### Name: sample_index
### Title: Sample the biomass with observation error
### Aliases: sample_index

### ** Examples

## Not run: 
##D # Find the example data location:
##D d <- system.file("extdata", package = "ss3sim")
##D f_in <- paste0(d, "/example-om/data.ss_new")
##D dat_list <- r4ss::SS_readdat(f_in, section = 2, verbose = FALSE)
##D dat_list <- change_fltname(dat_list)
##D outfile <- "test.dat"
##D ex1 <- sample_index(dat_list, outfile, fleets=c(2,3),
##D                     years=list(1938:2012, 1938:2012) ,
##D                     sds_obs=list(1e-6, 1e-6), write_file=FALSE,
##D                     make_plot = TRUE)
##D ex2 <- sample_index(dat_list, outfile, fleets=c(2,3),
##D                     years=list(1938:2012, 1938:2012) ,
##D                     sds_obs=list(.05, .05), write_file=FALSE,
##D                     make_plot = TRUE)
##D library(ggplot2)
##D ggplot(ex1, aes(x=year, y=obs, group=index, ymin=0,
##D                 colour=as.factor(index)))+geom_line() + geom_point(data=ex2,
##D                 aes(x=year, y=obs, colour=as.factor(index), group=index))
##D ## Exclude a fleet and have varying sds_obs by year
##D ex3 <- sample_index(dat_list, outfile, fleets=c(2,NA),
##D                     years=list(1938:2012, 1950),
##D                     sds_obs=list(seq(.001, .1, len=75), .1),
##D                     write_file=FALSE)
##D ggplot(ex3, aes(x=year, y=obs, group=index, ymin=0,
##D                 colour=as.factor(index)))+geom_point()
## End(Not run)



