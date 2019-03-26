library(galgo)


### Name: predict.BigBang
### Title: Predicts the class or fitting of new set of samples
### Aliases: predict.BigBang BigBang.predict predict.BigBang
###   predict,BigBang-method predict
### Keywords: methods internal methods

### ** Examples
## Not run: 
##D    #bb is a BigBang object
##D    #nd is a the new data frame, rows=genes, cols=samples
##D    cpm <- predict(bb, newdata=nd)
##D    cpm
##D  
##D    #permanent data = PLOTS
##D    cpm <- predict(bb, newdata=nd, permanent=TRUE)
##D    plot(bb, cpm, type="confusion")
##D    
## End(Not run)
 


