library(PBSmodelling)


### Name: focusWin
### Title: Set the Focus on a Particular Window
### Aliases: focusWin
### Keywords: methods

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D focus <- function() {
##D   winName <- getWinVal()$select;
##D   focusWin(winName);
##D   mess = paste("Calling focusWin(\"", winName, "\")\n",
##D     "getWinVal()$myvar = ", getWinVal()$myvar, "\n\n", sep="",collapse="")
##D   cat(mess); invisible()
##D }
##D #create three windows named win1, win2, win3
##D #each having three radio buttons, which are used to change the focus
##D for(i in 1:3) {
##D   winDesc <- c(
##D     paste('window onclose=closeWin name=win',i,' title="Win',i,'"', sep=''),
##D     paste('entry myvar ', i, sep=''),
##D     'radio name=select value=win1 text="one" function=focus mode=character',
##D     'radio name=select value=win2 text="two" function=focus mode=character',
##D     'radio name=select value=win3 text="three" function=focus mode=character');
##D   createWin(winDesc, astext=TRUE); };
##D })
## End(Not run)



