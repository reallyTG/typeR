library(ModelMap)


### Name: model.interaction.plot
### Title: plot of two-way model interactions
### Aliases: model.interaction.plot
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

########## Continuous Response, Categorical Predictors ############


#file name to store model:
MODELfn="RF_BIO_TCandNLCD"			

#predictors:
predList=c("TCB","TCG","TCW","NLCD")

#define which predictors are categorical:
predFactor=c("NLCD")

# Response name and type:
response.name="BIO"
response.type="continuous"

#identifier for individual training and test data points

unique.rowname="ID"


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
                       na.action=na.roughfix
)

###########################################################################
###################### make interaction plots: ############################
###########################################################################

#########################
### Perspective Plots ###
#########################


### specify first and third  predictors in 'predList (both continuous) ###

model.interaction.plot(	model.obj,
			x=1,y=3, 
			main=response.name, 
			plot.type="persp", 
			device.type="default") 

## Not run: 
##D ### specify predictors in 'predList' by name (one continuous one factored) ###
##D 
##D model.interaction.plot(model.obj,
##D 			x="TCB", y="NLCD", 
##D 			main=response.name, 
##D 			plot.type="persp", 
##D 			device.type="default") 
##D 
##D 
##D ###################
##D ### Image Plots ###
##D ###################
##D 
##D ### same as previous example, but image plot ###
##D 
##D 
##D l <- seq(100,0,length.out=101)
##D c <- seq(0,100,length.out=101)
##D col.ramp <- hcl(h = 120, c = c, l = l)
##D  
##D 
##D model.interaction.plot(	model.obj,
##D 				x="TCB", y="NLCD",
##D 				main=response.name,
##D 				plot.type="image", 
##D 				device.type="default",
##D 				col = col.ramp) 
##D 
##D 
##D #########################
##D ### 3-way Interaction ###
##D #########################
##D 
##D ### use 'pred.means' argument to fix values of additional predictors ###
##D 
##D ### factored 3rd predictor ###
##D 
##D interaction between TCG and TCW for 3 most common values of NLCD
##D 
##D nlcd<-levels(model.obj$predictor.data$NLCD)
##D nlcd.counts<-table(model.obj$predictor.data$NLCD)
##D nlcd.ordered<-nlcd[order(nlcd.counts,decreasing=TRUE)]
##D 
##D for(i in nlcd.ordered[1:3]){
##D 	pred.means=list(NLCD=i)
##D 
##D 	model.interaction.plot(	model.obj,
##D 				x="TCG", y="TCW",  
##D 				main=paste("NLCD=",i," (",nlcd.counts[i]," plots)", sep=""),
##D 				pred.means=pred.means, 
##D 				z.range=c(0,110),
##D 				theta=290,
##D 				plot.type="persp", 
##D 				device.type="default") 
##D }
##D 
##D 
##D 
##D ### continuos 3rd predictor ###
##D 
##D 
##D tcb<-seq(	min(model.obj$predictor.data$TCB),
##D 		max(model.obj$predictor.data$TCB),
##D 		length=3)
##D 
##D tcb<-signif(tcb,2)
##D 
##D for(i in tcb){
##D 	pred.means=list(TCB=i)
##D 
##D 	model.interaction.plot(	model.obj,
##D 				x="TCG", y="TCW",  
##D 				main=paste("TCB =",i),
##D 				pred.means=pred.means, 
##D 				z.range=c(0,120),
##D 				theta=290,
##D 				plot.type="persp", 
##D 				device.type="default") 
##D }
##D 
##D 
##D 
##D ### 4-way Interesting combos ###
##D 
##D 
##D tcb=c(1300,2900,3400)
##D nlcd=c(11,90,95)
##D 
##D for(i in 1:3){
##D 	pred.means=list(TCB=tcb[i],NLCD=nlcd[i])
##D 
##D 	model.interaction.plot(	model.obj,
##D 				x="TCG", y="TCW",  
##D 				main=paste("TCB =",tcb[i],"        NLCD =",nlcd[i]),
##D 				pred.means=pred.means, 
##D 				z.range=c(0,120),
##D 				theta=290,
##D 				plot.type="persp", 
##D 				device.type="default") 
##D }
## End(Not run) #end dontRun




