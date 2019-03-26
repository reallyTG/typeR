library(dataMaid)


### Name: visualize
### Title: Produce distribution plots
### Aliases: visualize

### ** Examples

 #Standard use: Return standalone code for plotting a function:
   visualize(c(1:10), "Variable 1", doEval = FALSE)

 #Define a new visualization function and call it using visualize either
 #using allVisual or a class specific argument:
   mosaicVisual <- function(v, vnam, doEval) {
     thisCall <- call("mosaicplot", table(v), main = vnam, xlab = "")
     if (doEval) {
       return(eval(thisCall))
     } else return(deparse(thisCall))
   }
   mosaicVisual <- visualFunction(mosaicVisual, 
                                  description = "Mosaicplots from graphics",
                                  classes = allClasses())
  
  #Inspect all options for visualFunctions:
  allVisualFunctions()


 ## Not run: 
##D    #set mosaicVisual for all variable types:
##D    visualize(c("1", "1", "1", "2", "2", "a"), "My variable", 
##D        visuals = setVisuals(all = "mosaicVisual"))
##D 
##D    #set mosaicVisual only for character variables:
##D    visualize(c("1", "1", "1", "2", "2", "a"), "My variable", 
##D       visuals = setVisuals(character = "mosaicVisual"))
##D 
##D    #this will use standardVisual, as our variable is not numeric:
##D    visualize(c("1", "1", "1", "2", "2", "a"), "My variable", 
##D        visuals = setVisuals(numeric = "mosaicVisual"))
##D  
## End(Not run)

   #return code for a mosaic plot
   visualize(c("1", "1", "1", "2", "2", "a"), "My variable", 
       allVisuals = "mosaicVisual", doEval=FALSE)

 ## Not run: 
##D  #Produce multiple plots easily by calling visualize on a full dataset:
##D    data(testData)
##D    testData2 <- testData[, c("charVar", "factorVar", "numVar", "intVar")]
##D    visualize(testData2)
##D    
##D  #When using visualize on a dataset, datatype specific arguments have no
##D  #influence:
##D    visualize(testData2, setVisuals(character = "basicVisual", 
##D        factor = "basicVisual"))
##D    
##D  #But we can still use the "all" argument in setVisuals:
##D    visualize(testData2, visuals =  setVisuals(all = "basicVisual"))
##D  
## End(Not run)




