library(r4ss)


### Name: SS_profile
### Title: Run a likelihood profile in Stock Synthesis.
### Aliases: SS_profile
### Keywords: data manip

### ** Examples


  ## Not run: 
##D # note: don't run this in your main directory
##D # make a copy in case something goes wrong
##D mydir <- "C:/ss/Simple - Copy"
##D 
##D # the following commands related to starter.ss could be done by hand
##D # read starter file
##D starter <- SS_readstarter(file.path(mydir, 'starter.ss'))
##D # change control file name in the starter file
##D starter$ctlfile <- "control_modified.ss"
##D # make sure the prior likelihood is calculated
##D # for non-estimated quantities
##D starter$prior_like <- 1
##D # write modified starter file
##D SS_writestarter(starter, dir=mydir, overwrite=TRUE)
##D 
##D # vector of values to profile over
##D h.vec <- seq(0.3,0.9,.1)
##D Nprofile <- length(h.vec)
##D 
##D # run SS_profile command
##D profile <- SS_profile(dir=mydir, # directory
##D                       # "NatM" is a subset of one of the
##D                       # parameter labels in control.ss_new
##D                       model="ss3_safe",
##D                       masterctlfile="control.ss_new",
##D                       newctlfile="control_modified.ss",
##D                       string="steep",
##D                       profilevec=h.vec)
##D 
##D 
##D # read the output files (with names like Report1.sso, Report2.sso, etc.)
##D profilemodels <- SSgetoutput(dirvec=mydir, keyvec=1:Nprofile)
##D # summarize output
##D profilesummary <- SSsummarize(profilemodels)
##D 
##D # OPTIONAL COMMANDS TO ADD MODEL WITH PROFILE PARAMETER ESTIMATED
##D MLEmodel <- SS_output("C:/ss/SSv3.24l_Dec5/Simple")
##D profilemodels$MLE <- MLEmodel
##D profilesummary <- SSsummarize(profilemodels)
##D # END OPTIONAL COMMANDS
##D 
##D # plot profile using summary created above
##D SSplotProfile(profilesummary,           # summary object
##D               profile.string = "steep", # substring of profile parameter
##D               profile.label="Stock-recruit steepness (h)") # axis label
##D 
##D # make timeseries plots comparing models in profile
##D SSplotComparisons(profilesummary,legendlabels=paste("h =",h.vec))
##D 
## End(Not run)




