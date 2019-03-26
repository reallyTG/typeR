library(dynatopmodel)


### Name: disp_output
### Title: Display output of a Dynamic TOPMODEL run
### Aliases: disp_output

### ** Examples

## Not run: 
##D # Show the output of the storm simulation, overriding label colours and vertical axis limits.
##D require(dynatopmodel)
##D 
##D data(brompton)
##D 
##D x11()
##D with(brompton$storm.run, disp_output(evap=ae*1000,qobs=qobs*1000,
##D                                      qsim=qsim*1000, rain=rain*1000,
##D                                      max.q=2, cex.main=1, col.axis="slategrey", las.time=1))
## End(Not run)



