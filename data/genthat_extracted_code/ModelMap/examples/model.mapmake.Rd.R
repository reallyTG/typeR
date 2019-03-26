library(ModelMap)


### Name: model.mapmake
### Title: Map Making
### Aliases: model.mapmake
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


###########################################################################
######################## Define the model: ################################
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
############ Then Run this code to predict map pixels #####################
###########################################################################


### Create a the filename (including path) for the rast Look up Tables ###


rastLUTfn.2001 <- system.file(	"extdata",
				"helpexamples",
				"LUT_2001.csv",
				package="ModelMap")
                         
                 



### Load rast LUT table, and add path to the predictor raster filenames in column 1 ###

rastLUT.2001 <- read.table(rastLUTfn.2001,header=FALSE,sep=",",stringsAsFactors=FALSE)

for(i in 1:nrow(rastLUT.2001)){
	rastLUT.2001[i,1] <- system.file("extdata",
					"helpexamples",
					rastLUT.2001[i,1],
					package="ModelMap")
}                                 


### Define filename for map  output ###

OUTPUTfn.2001 <- "RF_BIO_TCandNLCD_01.img"
OUTPUTfn.2001 <- paste(folder,OUTPUTfn.2001,sep="/")


### Create image files of predicted map data ###

model.mapmake( model.obj=model.obj,
               folder=folder,		
               rastLUTfn=rastLUT.2001,
           # Mapping arguments						
               OUTPUTfn=OUTPUTfn.2001
               )


###########################################################################
################ run this code to create maps in R ########################
###########################################################################

### Define Color Ramp ###

l <- seq(100,0,length.out=101)
c <- seq(0,100,length.out=101)
col.ramp <- hcl(h = 120, c = c, l = l)


### read in map data ###

mapgrid.2001 <- raster(OUTPUTfn.2001)

#mapgrid.2001 <- setMinMax(mapgrid.2001)


### create map ###

dev.new(width = 5, height = 5)
opar <- par(mar=c(3,3,2,1),oma=c(0,0,3,4),xpd=NA)

zlim <- c(0,max(maxValue(mapgrid.2001)))
legend.label<-rev(pretty(zlim,n=5))
legend.colors<-col.ramp[trunc((legend.label/max(legend.label))*100)+1]

image(  mapgrid.2001, col = col.ramp, zlim=zlim, asp=1, bty="n", 
        xaxt="n", yaxt="n", main="", xlab="", ylab="")
mtext("2001 Imagery",side=3,line=1,cex=1.2)

legend(	x=xmax(mapgrid.2001),y=ymax(mapgrid.2001),
	legend=legend.label,
	fill=legend.colors,
	bty="n",
	cex=1.2
)
mtext("Predictions",side=3,line=1,cex=1.5,outer=TRUE)
par(opar)






