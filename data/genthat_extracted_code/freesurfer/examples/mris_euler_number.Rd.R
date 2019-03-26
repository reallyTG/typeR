library(freesurfer)


### Name: mris_euler_number
### Title: MRI Euler Number
### Aliases: mris_euler_number

### ** Examples

## Not run: 
##D if (have_fs()) {
##D    img = oro.nifti::nifti(array(rnorm(5*5*5), dim = c(5,5,5))) 
##D    res = mris_euler_number(img, outfile = tempfile(fileext = ".mgz"))
##D } 
## End(Not run)



