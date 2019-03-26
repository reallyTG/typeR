library(CCTpack)


### Name: cctgui
### Title: The CCT GUI
### Aliases: cctgui

### ** Examples

#First visit  'mcmc-jags.sourceforge.net/' to install JAGS (Plummer, 2003) if it's not installed

####################
#Instructions for Using the GUI
####################

#1) Convert your data into a .csv file
### Or use our example data such as with the following commands: 

data(hotcold); 
write.csv(x=hotcold, file="hotcold.csv",row.names=FALSE)

#2) Invoke the GUI 

cctgui()

#Click "Load Data" then find and select "hotcold.csv"
#Note that 23 respondents, 27 items are detected, 
#      and that it is Dichotomous (binary) data, which the GCM is applicable for
#      the GUI detects that there are 14 missing data values in the matrix
#Click "Scree Plot"  Note that there are 2 apparent significant factors, 
#      thus we assume 2 cultures in the data, click "yes" to estimate item difficulty
#Click "Apply CCT Model" and wait for the inference to finish
#Take note of the Number of Rhats above 1.1 (if too many, perhaps run more samples)
#Click "Run Checks" to run the posterior predictive checks, wait for the checks to complete
#Note that the model satisfies both checks in the plots shown
#Proceed to inspect the inference results by clicking "Plot Results"
#type 'cctfit$MVest' to view the model estimates of the 14 missing data values
#Click "Export Results" to save the plot and the inference results
#The Inference results are included in the object 'cctfit'
#Type 'cctfit' in the R prompt to see the summary, 
#   type 'str(cctfit)' to see what the object contains

####################
#2) Instructions for Using the Command Prompt
####################

#The corollary to the GUI instructions above, for the command line, is below

data(hotcold);   #for an ordinal data example, use data(raterdata)

#Loads data and provides the Scree Plot
# cctscree(data = hotcold)

#Loads data and Runs the Inference    			
# cctfit <- cctapply(data = hotcold,clusters=2,itemdiff=TRUE,samples=10000,
#                     chains=3,burnin=2000,runchecks=FALSE)  

#Calculates and Plots Posterior Predictive Checks
# cctfit <- cctppc(cctfit)

#Show Missing Value Model Estimates if there was missing data
# cctfit$MVest

#Plots Posterior Results
# cctresults(cctfit) 		  

#Exports Results
# cctexport(cctfit,filename="CCTpackdata.Rdata") 

##Note: if an insufficient memory message occurs, you can increase the
##memory allocation by the command 'memory.limit(25000)'  (or as high as needed)



