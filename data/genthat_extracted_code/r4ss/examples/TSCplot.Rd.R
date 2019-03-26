library(r4ss)


### Name: TSCplot
### Title: Create a plot for the TSC report
### Aliases: TSCplot
### Keywords: data list manip plot

### ** Examples


  ## Not run: 
##D   ######################################
##D   #DO NOT RUN
##D     library(r4ss)
##D     update_r4ss_files()
##D 
##D     # ** CHANGE TO THE BASE DIRECTORY
##D     directory <- "C:\NOAA2011\Dover\Models\base_20110701"
##D 
##D     base <- SS_output(dir=directory,covar=F,verbose=F)
##D 
##D     #show the plot in R
##D     TSCplot(base)
##D     TSCplot(base,yrs=2000:2011,pchSpace = 1)
##D     #Create the plot as a PNG file
##D     TSCplot(base,makePNG="C:\NOAA2012\Assessments\TSCdover.png")
##D     #Create the plot as a PDF file
##D     TSCplot(base,makePDF="C:\NOAA2012\Assessment\TSCdover.pdf")
##D 
##D     # ** Hake model with MCMC results
##D     SSdir <- "C:/NOAA2012/Hake/Models"
##D     base <- SS_output(dir=paste(SSdir,"81_base_MCMC",sep="/"),covar=F)
##D     tmp <- SSgetMCMC(dir=paste(SSdir,"81_base_MCMC",sep="/"),writecsv=F)
##D     base$mcmc <- data.frame(tmp$model1)
##D     TSCplot(base,ylimDepl = c(0,1.25),pchSpace=1,MCMC=T)
##D 
##D 
##D   ###############################################
##D   
## End(Not run)




