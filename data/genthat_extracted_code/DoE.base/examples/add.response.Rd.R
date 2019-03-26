library(DoE.base)


### Name: add.response
### Title: Function to add response values to an experimental design
### Aliases: add.response
### Keywords: array design

### ** Examples

       plan <- fac.design(nlevels=c(2,3,2,4))
       result <- rnorm(2*3*2*4)
       add.response(plan,response=result)
       ## direct use of rnorm() is also possible, but looks better with 48 
       add.response(plan,response=rnorm(48))
       
   ## Not run: 
##D    
##D        export.design(path="c:/projectA/experiments",plan)
##D        ## open exported file c:/projectA/experiments/plan.html
##D        ##        with Excel
##D        ## carry out the experiment, input data in Excel or elsewhere
##D        ##        store as csv file with the same name (or a different one, just use 
##D        ##        the correct storage name later in R), after deleting 
##D        ##        the legend portion to the right of the data area
##D        ##        (alternatively, input data by typing them in in R (function fix or R-commander)
##D        add.response(design="plan",response="c:/projectA/experiments/plan.csv",
##D                  rdapath="c:/projectA/experiments/plan.rda")
##D        ## plan is the name of the design in the workspace stored in rdapath
##D        ## assuming only responses were typed in
##D        ## should work on your computer regardless of system, 
##D        ##         if you adapt the path names accordingly
##D    
## End(Not run)



