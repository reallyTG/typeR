library(dataMaid)


### Name: visualFunction
### Title: Create an object of class visualFunction
### Aliases: visualFunction

### ** Examples

#Defining a new visualFunction:
 mosaicVisual <- function(v, vnam, doEval) {
   thisCall <- call("mosaicplot", table(v), main = vnam, xlab = "")
   if (doEval) {
    return(eval(thisCall))
   } else return(deparse(thisCall))
 }
 mosaicVisual <- visualFunction(mosaicVisual, description = "Mosaicplots from graphics",
                                classes = allClasses())

#mosaicVisual is now included in a allVisualFunctions() call:
 allVisualFunctions()
 
#Create a mosaic plot:
 ABCvar <- c(rep("a", 10), rep("b", 20), rep("c", 5))
 mosaicVisual(ABCvar, "ABCvar", TRUE)
 
#Create a character string with the code for a mosaic plot:
 mosaicVisual(ABCvar, "ABCVar", FALSE)

#Extract or set description of a visualFunction:
 description(mosaicVisual)
 description(mosaicVisual) <- "A cubist version of a pie chart"
 description(mosaicVisual)





