library(ModelMap)


### Name: model.importance.plot
### Title: Compares the variable importance of two models with a back to
###   back barchart.
### Aliases: model.importance.plot
### Keywords: models

### ** Examples


###########################################################################
############################# Run this set up code: #######################
###########################################################################

# set seed:
seed=38

# Define training and test files:

qdata.trainfn = system.file("extdata", "helpexamples","DATATRAIN.csv", package = "ModelMap")

# Define folder for all output:
folder=getwd()	


#identifier for individual training and test data points

unique.rowname="ID"

##################################################################
########## Continuous Response, Continuous Predictors ############
##################################################################

#file names:
MODELfn.RF="RF_Bio_TC"				

#predictors:
predList=c("TCB","TCG","TCW")	

#define which predictors are categorical:
predFactor=FALSE	

# Response name and type:
response.name="BIO"
response.type="continuous"

########## Build Models #################################

model.obj.RF = model.build( model.type="RF",
                       qdata.trainfn=qdata.trainfn,
                       folder=folder,		
                       unique.rowname=unique.rowname,		
                       MODELfn=MODELfn.RF,
                       predList=predList,
                       predFactor=predFactor,
                       response.name=response.name,
                       response.type=response.type,
                       seed=seed
)

########## Make Imortance Plot - RF Importance type 1 vs 2 #######

model.importance.plot(	model.obj.1=model.obj.RF, 
			model.obj.2=model.obj.RF, 
			model.name.1="PercentIncMSE", 
			model.name.2="IncNodePurity",
			imp.type.1=1,
			imp.type.2=2,
			scale.by="sum",
			sort.by="predList", 
			predList=predList,
			main="Imp type 1 vs Imp type 2",
			device.type="default")


## Not run: 
##D ##################################################################
##D ########## Categorical Response, Continuous Predictors ###########
##D ##################################################################
##D 
##D file name:
##D MODELfn="RF_NLCD_TC"				
##D 
##D predictors:
##D predList=c("TCB","TCG","TCW")	
##D 
##D define which predictors are categorical:
##D predFactor=FALSE	
##D 
##D  Response name and type:
##D response.name="NLCD"
##D response.type="categorical"
##D 
##D ########## Build Model #################################
##D 
##D model.obj.NLCD = model.build( model.type="RF",
##D                        qdata.trainfn=qdata.trainfn,
##D                        folder=folder,		
##D                        unique.rowname=unique.rowname,	
##D                        MODELfn=MODELfn,
##D                        predList=predList,
##D                        predFactor=predFactor,
##D                        response.name=response.name,
##D                        response.type=response.type,
##D                        seed=seed)
##D 
##D ############## Make Imortance Plot ###################
##D 
##D model.importance.plot(	model.obj.1=model.obj.NLCD, 
##D 			model.obj.2=model.obj.NLCD, 
##D 			model.name.1="NLCD=41", 
##D 			model.name.2="NLCD=42",
##D 			class.1="41",
##D 			class.2="42",
##D 			scale.by="sum",
##D 			sort.by="predList", 
##D 			predList=predList,
##D 			main="Class 41 vs. Class 42",
##D 			device.type="default")
##D 
##D 
##D ##################################################################
##D ############## Conditonal inference forest models ################
##D ##################################################################
##D 
##D #predictors:
##D predList=c("TCB","TCG","TCW","NLCD")
##D 
##D #define which predictors are categorical:
##D predFactor=c("NLCD")
##D 
##D #binary response
##D response.name="CONIFTYP"
##D response.type="binary"
##D MODELfn.CF="CF_CONIFTYP_TCandNLCD"
##D 
##D ####################### Build Model ##############################
##D 
##D model.obj.CF = model.build( model.type="CF",
##D                        qdata.trainfn=qdata.trainfn,
##D                        folder=folder,		
##D                        unique.rowname=unique.rowname,		
##D                        MODELfn=MODELfn.CF,
##D                        predList=predList,
##D                        predFactor=predFactor,
##D                        response.name=response.name,
##D                        response.type=response.type,
##D                        seed=seed
##D )
##D 
##D ################## Make Imortance Plot ##########################
##D 
##D #Conditional vs. Unconditional importance#
##D 
##D model.importance.plot(	model.obj.1=model.obj.CF, 
##D 			model.obj.2=model.obj.CF, 
##D 			model.name.1="conditional",
##D 			model.name.2="unconditional",
##D 			imp.type.1=1,
##D 			imp.type.2=1, 
##D 			cf.conditional.1=TRUE,
##D 			cf.conditional.2=FALSE,
##D 			scale.by="sum",
##D 			sort.by="predList", 
##D 			predList=predList,
##D 			main="Conditional verses Unconditional",
##D 			device.type="default"
##D )
##D 
## End(Not run) # end dontRun



