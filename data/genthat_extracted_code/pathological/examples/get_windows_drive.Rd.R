library(pathological)


### Name: get_windows_drive
### Title: On Windows, return the drive of the path
### Aliases: get_windows_drive get_drive

### ** Examples

## No test: 
 # often takes > 5s to run
get_windows_drive(c(".", "~", r_home(), temp_dir(), "\\\\foo/bar"))
## End(No test)



