library(tcltk2)


### Name: tk2dialogs
### Title: Additional Tk dialog boxes
### Aliases: tk2chooseFont tk2swaplist
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D tk2chooseFont()
##D tk2chooseFont(font = "{courier} 9", title = "Choose a fixed font",
##D     fonttype = "fixed", style = 4, sizetype = "all")
##D tk2chooseFont(font = "Verdana 12 bold italic underline overstrike",
##D     fonttype = "prop", style = 2, sizetype = "point")
##D 
##D tk2swaplist(1:10, 1:5) # integer
##D tk2swaplist(as.numeric(1:10), 1:5) # double
##D tk2swaplist(paste("V", 1:10), paste("V", 1:5)) # character
##D tk2swaplist(as.factor(1:10), 1:5) # factor
##D tk2swaplist(as.ordered(1:10), 1:5) # ordered
## End(Not run)



