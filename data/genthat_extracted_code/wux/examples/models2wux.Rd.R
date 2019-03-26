library(wux)


### Name: models2wux
### Title: Processing climate model output
### Aliases: models2wux
### Keywords: datagen IO file spatial ts multivariate

### ** Examples

## This example shows a typical workflow for models2wux, the workhorse of
## the wux package. Going through this example step-by-step, you will
## retrieve NetCDF files of two CMIP5 simulations and aggregate them to
## an R data.frame for further analysis. 

## I) Load wux functions and example datasets...
library("wux")

## II) You need to obtain the climate simulations first. You can get
## started with downloading some example CMIP5 NetCDF files from the
## ESGF visiting for example http://pcmdi9.llnl.gov or using the
## CMIP5fromESGF function. Here, we dowload two simulations "NorESM1-M" and
## "CanESM2" into your home directory "~/tmp/CMIP5/" which will be
## created automatically. You will need a valid account at any ESGF
## node for this function to run. See ?CMIP5fromESGF for further help.
## Not run: 
##D CMIP5fromESGF(save.to = "~/tmp/CMIP5/",
##D                 models = c("NorESM1-M", "CanESM2"),
##D                 variables = c("tas"),
##D                 experiments= c("historical", "rcp85"))
## End(Not run)

## III) Specify those downloaded data for models2wux. models2wux needs
## to know where the data is stored on your HDD and needs to have access
## to certain metadata of the climate simulator, which you have to
## provide as well. This information is stored in a list, which should
## be saved as ONE file somewhere on your computer. We call this
## information "modelinput". You should share this 
## file with you collegues using the same IT infrastructure to share
## synergies. You can create such a file based on the data downloade
## by "CMIP5fromESGF":
## Not run: 
##D CMIP5toModelinput(filedir = "~/tmp/CMIP5",
##D                   save.to = "~/modelinput.R")
## End(Not run)
## This file then would look this:
data(modelinput_test)

## It specifies temperature and precipitation files for the two
## simulations "NorESM1-M" and "CanESM2" (RCP8.5), stored in
## "~/tmp/CMIP5/". 
str(modelinput_test)

## IV) Next, you need to specify which simulations you want to read in
## with models2wux, what kind of statistics to calculate, what subregion
## to analyze, what time periods and seasons to define, and so on. This
## is done with a user input file, which cntains a list with all the
## necessary information. You typically use different userinput files
## for different analysis, whereas your modelinput should remain in ONE
## file which will be updated each time you obtain a new climate
## simulation. One example user input file, which reads in both
## simulations specified above for the Alpine domain and returns their
## projected climate change signal, could look like follows: 
data(userinput_CMIP5_changesignal)
str(userinput_CMIP5_changesignal)

## alternatively following userinput returns a timeseries of both
## models, which only differs by the "time.series" tag and differently
## specified periods: 
data(userinput_CMIP5_timeseries)
str(userinput_CMIP5_timeseries)

## V) At last you can run models2wux to obtain a data.frame of the
## specified climatic change features defined above:
## Not run: 
##D climchange.df <- models2wux(userinput = userinput_CMIP5_changesignal,
##D                             modelinput = modelinput_test)
## End(Not run)
## A better practice is to safe both input files containing a named 
## list each somewhere on your disk and pass the files directly to the
## models2wux function. If you  had stored the two files in your home
## directory as e.g. "~/userinput.R" and "~/modelinput.R" you can call: 
## Not run: 
##D climchange.df <- models2wux(userinput = "~/userinput.R",
##D                             modelinput = "~/modelinput.R")
## End(Not run)
## if you downloaded the data correctly, you should obtain a data.frame:
## Not run: 
##D   climchange.df
## End(Not run)			    

## which should be identical to this example data.frame:
data(CMIP5_example_changesignal)
CMIP5_example_changesignal

## Instead of calculating the climate change signals, you can also
## generate time series of the two models aggregated over the Alpine
## domain, using a different user input file:
## Not run: 
##D climchange.df <- models2wux(userinput = userinput_CMIP5_timeseries,
##D                             modelinput = modelinput_test)
## End(Not run)


## VI) Finally you can make all kind of analysis you are interested in,
## using either functions from wux or from any other R funtionality
summary(CMIP5_example_changesignal, parms = "delta.air_temperature")

## or plot timeseries as
require(lattice)
data(CMIP5_example_timeseries)
## Not run: 
##D xyplot(air_temperature ~ year|season,
##D        groups = acronym,
##D        data = CMIP5_example_timeseries,
##D        type = c("l", "g"),
##D        main = "NorESM1-M and CanESM2 simulations over Alpine Region\nRCP 8.5 forcing")
## End(Not run)



