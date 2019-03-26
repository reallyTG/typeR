library(ModelMap)


### Name: model.explore
### Title: Exploratory data analysis
### Aliases: model.explore
### Keywords: models

### ** Examples


###########################################################################
############################# Run this set up code: #######################
###########################################################################

###Define training and test files:
qdata.trainfn = system.file("extdata", "helpexamples","DATATRAIN.csv", package = "ModelMap")

###Define folder for all output:
folder=getwd()	

###identifier for individual training and test data points
unique.rowname="ID"			

###predictors:
predList=c("TCB","TCG","TCW","NLCD")

###define which predictors are categorical:
predFactor=c("NLCD")

###Create a the filename (including path) for the rast Look up Tables ###
rastLUTfn.2001 <- system.file(	"extdata",
				"helpexamples",
				"LUT_2001.csv",
				package="ModelMap")

###Load rast LUT table, and add path to the predictor raster filenames in column 1 ###
rastLUT.2001 <- read.table(rastLUTfn.2001,header=FALSE,sep=",",stringsAsFactors=FALSE)

for(i in 1:nrow(rastLUT.2001)){
	rastLUT.2001[i,1] <- system.file("extdata",
					"helpexamples",
					rastLUT.2001[i,1],
					package="ModelMap")
}                                 

#################Continuous Response###################

###Response name and type:
response.name="BIO"
response.type="continuous"

###file name to store model:
OUTPUTfn="BIO_TCandNLCD.img"

###run model.explore

model.explore(	qdata.trainfn=qdata.trainfn,
		folder=folder,		
		predList=predList,
		predFactor=predFactor,

		response.name=response.name,
		response.type=response.type,
	
		unique.rowname=unique.rowname,

		OUTPUTfn=OUTPUTfn,
		device.type="jpeg",
		jpeg.res=144,


		# Raster arguments
		rastLUTfn=rastLUT.2001,
		na.value=-9999,

		# colors for continuous predictors
		col.ramp=rainbow(101,start=0,end=.5), 
		# colors for categorical predictors
		col.cat=c("wheat1","springgreen2","darkolivegreen4",
			  "darkolivegreen2","yellow","thistle2",
			  "brown2","brown4")
)















