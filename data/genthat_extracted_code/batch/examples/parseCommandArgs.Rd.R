library(batch)


### Name: parseCommandArgs
### Title: Parse Command-Line Arguments
### Aliases: parseCommandArgs
### Keywords: interface

### ** Examples

## Not run: 
##D   ## mainSim.R
##D   ## Put the following code in the file 'mainSim.R'.
##D   ##
##D   ## Try this out by running:
##D   ##   R --vanilla < mainSim.R > mainSim.Rout1013
##D   ##   R --vanilla --args seed 1014 bbeta 0 < mainSim.R > mainSim.Rout1014
##D   ##   R --vanilla --args seed 1015 bbeta "c(10,20)" < mainSim.R > mainSim.Rout1015
##D   library(batch)
##D 
##D   ## Set values of some parameters
##D   seed <- 1013 ## default value
##D   bbeta <- 5   ## default value, note 'beta' is an R function, so we can't use that
##D 
##D   ## Overwrite the values of 'seed' and 'bbeta', e.g., if they have been
##D   ##  passed in from the command prompt.
##D   parseCommandArgs()
##D 
##D   ## Will disply the default values on the first run,
##D   ##  but bbeta=1014 and bbeta=0 on the second run.
##D   print(seed)
##D   print(bbeta)
##D 
##D   ## ... your simualtion code
##D 
##D   ## Write out your results to a csv file
##D   write.csv(data.frame(seed=seed, bbeta=paste(bbeta,collapse="~")),
##D     paste("res",seed,".csv",sep=""), row.names=FALSE)
##D 
##D   ## R.miSniam
## End(Not run)

## Not run: 
##D   ## run_mainSim_parallel.R
##D   ## Put the following code in 'run_mainSim_parallel.R'
##D   ##
##D   ## Selects a variety of parameter combinations to run
##D   ##    mainSim.R in parallel on a cluster.
##D   ##
##D   ## First see the commands that would be run (to make sure they are correct) with
##D   ##   R --vanilla --args RUN 0 < run_mainSim_parallel.R
##D   ##  Then run the commands with
##D   ##   R --vanilla < run_mainSim_parallel.R
##D   ##  or
##D   ##   R --vanilla --args RUN 1 < run_mainSim_parallel.R
##D   ##  These will all default to run locally.
##D   ## To run on a mosix cluster, run with
##D   ##   R --vanilla --args RUN 1 RBATCH mosix < run_mainSim_parallel.R
##D   ## And on a LSF cluster, run with
##D   ##   R --vanilla --args RUN 1 RBATCH lsf < run_mainSim_parallel.R
##D   library(batch)
##D 
##D   parseCommandArgs() ## for overwriting default values; here, 'run'
##D 
##D   ## Choose a high enough seed for later for pasting the results together
##D   ##  (1,...,9,10) sorts not the way you want, for example.
##D   seed <- 1000
##D   for(i in 1:10)
##D     seed <- rbatch("mainSim.R", seed=seed, bbeta=i)
##D 
##D   ## Only for local (but it does not hurt to run in other situations,
##D   ##  so suggested in all cases).
##D   ## This actually runs all the commands when run on the local system.
##D   rbatch.local.run()
##D   ## R.lellarap_miSniam_nur
## End(Not run)
## Not run: 
##D   ## paste_mainSim_results.R
##D   ## Put the following code in paste_mainSim_results.R (or just
##D   ##  type them in), and run
##D   ##   R --vanilla < paste_mainSim_results.R
##D   ##
##D   ## Pastes all of the csv files created in 'run_mainSim_parallel'
##D   ##  together.
##D   library(batch)
##D   mergeCsv()
## End(Not run)



