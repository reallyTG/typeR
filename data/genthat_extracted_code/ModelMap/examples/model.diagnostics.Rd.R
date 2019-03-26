library(ModelMap)


### Name: model.diagnostics
### Title: Model Predictions and Diagnostics
### Aliases: model.diagnostics
### Keywords: models

### ** Examples

###########################################################################
############################# Run this set up code: #######################
###########################################################################

# set seed:
seed=38

# Define training and test files:

qdata.trainfn = system.file("extdata", "helpexamples","DATATRAIN.csv", package = "ModelMap")
qdata.testfn = system.file("extdata", "helpexamples","DATATEST.csv", package = "ModelMap")

# Define folder for all output:
folder=getwd()	

#identifier for individual training and test data points

unique.rowname="ID"


###########################################################################
############## Pick one of the following sets of definitions: #############
###########################################################################


########## Continuous Response, Continuous Predictors ############

#file name to store model:
MODELfn="RF_Bio_TC"				

#predictors:
predList=c("TCB","TCG","TCW")	

#define which predictors are categorical:
predFactor=FALSE	

# Response name and type:
response.name="BIO"
response.type="continuous"


########## binary Response, Continuous Predictors ############

#file name to store model:
MODELfn="RF_CONIFTYP_TC"				

#predictors:
predList=c("TCB","TCG","TCW")		

#define which predictors are categorical:
predFactor=FALSE

# Response name and type:
response.name="CONIFTYP"

# This variable is 1 if a conifer or mixed conifer type is present, 
# otherwise 0.

response.type="binary"


########## Continuous Response, Categorical Predictors ############

# In this example, NLCD is a categorical predictor.
#
# You must decide what you want to happen if there are categories
# present in the data to be predicted (either the validation/test set
# or in the image file) that were not present in the original training data.
# Choices:
#       na.action =  "na.omit"
#                    Any validation datapoint or image pixel with a value for any
#                    categorical predictor not found in the training data will be
#                    returned as NA.
#       na.action =  "na.roughfix"
#                    Any validation datapoint or image pixel with a value for any
#                    categorical predictor not found in the training data will have
#                    the most common category for that predictor substituted,
#                    and the a prediction will be made.

# You must also let R know which of the predictors are categorical, in other
# words, which ones R needs to treat as factors.
# This vector must be a subset of the predictors given in predList

#file name to store model:
MODELfn="RF_BIO_TCandNLCD"			

#predictors:
predList=c("TCB","TCG","TCW","NLCD")

#define which predictors are categorical:
predFactor=c("NLCD")

# Response name and type:
response.name="BIO"
response.type="continuous"



###########################################################################
########################### build model: ##################################
###########################################################################


### create model ###

model.obj = model.build( model.type="RF",
                       qdata.trainfn=qdata.trainfn,
                       folder=folder,		
                       unique.rowname=unique.rowname,	
                       MODELfn=MODELfn,
                       predList=predList,
                       predFactor=predFactor,
                       response.name=response.name,
                       response.type=response.type,
                       seed=seed,
                       na.action="na.roughfix"
)

###########################################################################
#### Then Run this code make validation predictions and diagnostics: ######
###########################################################################


### for Out-of-Bag predictions ###

MODELpredfn<-paste(MODELfn,"_OOB",sep="")
PRED.OOB<-model.diagnostics( 	model.obj=model.obj,
				qdata.trainfn=qdata.trainfn,
                   		folder=folder,		
                  	 	unique.rowname=unique.rowname,
                	# Model Validation Arguments
                   		prediction.type="OOB",
                   		MODELpredfn=MODELpredfn,
                   		device.type=c("default","jpeg","pdf"),	
                   		na.action="na.roughfix"
)
PRED.OOB

### for Cross-Validation predictions ###

#MODELpredfn<-paste(MODELfn,"_CV",sep="")
#PRED.CV<-model.diagnostics( 	model.obj=model.obj,
#                   		qdata.trainfn=qdata.trainfn,
#                   		folder=folder,		
#                   		unique.rowname=unique.rowname,
#                   		seed=seed,
#                	# Model Validation Arguments
#                   		prediction.type="CV",
#                   		MODELpredfn=MODELpredfn,
#                   		device.type=c("default","jpeg","pdf"),	
#                   		v.fold=10,
#                   		na.action="na.roughfix"
#)
#PRED.CV

### for Independent Test Set predictions ###

#MODELpredfn<-paste(MODELfn,"_TEST",sep="")
#PRED.TEST<-model.diagnostics( 	model.obj=model.obj,
#                   		qdata.testfn=qdata.testfn,
#                   		folder=folder,		
#                   		unique.rowname=unique.rowname,
#                	# Model Validation Arguments
#                   		prediction.type="TEST",
#                   		MODELpredfn=MODELpredfn,
#                   		device.type=c("default","jpeg","pdf"),	
#                   		na.action="na.roughfix"
#)
#PRED.TEST




