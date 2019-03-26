library(matlabr)


### Name: run_matlab_code
### Title: Runs matlab code
### Aliases: run_matlab_code

### ** Examples

if (have_matlab()){
   run_matlab_code(c("disp('The version of the matlab is:')", "disp(version)"),
   paths_to_add = "~/")
}
## Not run: 
##D  
##D if (have_matlab()){ 
##D    run_matlab_code("disp(version)")
##D    run_matlab_code("disp(version)", paths_to_add = "~/")
##D    run_matlab_code(c("x = 5", "disp(['The value of x is ', num2str(x)])"))
##D }
## End(Not run)



