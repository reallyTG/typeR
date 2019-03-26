library(MareyMap)


### Name: InterpolationParam-class
### Title: Class "InterpolationParam"
### Aliases: InterpolationParam InterpolationParam-class
###   paramDefault<-,InterpolationParam-method
###   paramDefault,InterpolationParam-method
###   paramDesc<-,InterpolationParam,character-method
###   paramDesc,InterpolationParam-method
###   paramFun<-,InterpolationParam,character-method
###   paramFun,InterpolationParam-method
###   paramMax<-,InterpolationParam-method
###   paramMax,InterpolationParam-method
###   paramMin<-,InterpolationParam-method
###   paramMin,InterpolationParam-method
###   paramName<-,InterpolationParam,character-method
###   paramName,InterpolationParam-method
###   paramType<-,InterpolationParam,character-method
###   paramType,InterpolationParam-method
###   paramValues<-,InterpolationParam,vector-method
###   paramValues,InterpolationParam-method
### Keywords: classes

### ** Examples

  nam <- InterpolationParam()
	paramName(nam) <- "name"
	paramDesc(nam) <- "The name of the interpolation.\n"
	paramType(nam) <- "character"
	paramDefault(nam) <- "default name"
	paramMin(nam) <- 1
	paramMax(nam) <- NULL	
	paramFun(nam) <- "name"

	vis <- InterpolationParam()
	paramName(vis) <- "visible"
	paramDesc(vis) <- "Whether the line is visible on the plot or not"
	paramType(vis) <- "logical"
	paramDefault(vis) <- TRUE
	paramFun(vis) <- "visible"
	
	sav <- InterpolationParam()
	paramName(sav) <- "persistent"
	paramDesc(sav) <- "Indicate if the interpolation is to be be kept \n\
  when the map is saved to text file"
	paramType(sav) <- "logical"
	paramDefault(sav) <- TRUE
	paramFun(sav) <- "persistent"
	
	col <- InterpolationParam()
	paramName(col) <- "line color"
	paramDesc(col) <- "color of the line"
	paramType(col) <- "color"
	paramDefault(col) <- "#000000"
	paramFun(col) <- "color"



