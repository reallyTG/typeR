library(PBSmodelling)


### Name: chooseWinVal
### Title: Choose and Set a String Item in a GUI
### Aliases: chooseWinVal
### Keywords: device utilities

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D dfnam <-
##D   c("airquality","attitude","ChickWeight","faithful","freeny",
##D   "iris","LifeCycleSavings","longley","morley","Orange",
##D   "quakes","randu","rock","stackloss","swiss","trees")
##D 
##D wlist <- c(
##D   "window name=choisir title=\"Test chooseWinVal\"",
##D   "label text=\"Press <ENTER> in the green entry box
##D   \nto choose a file, then press <GO>\" sticky=W pady=5",
##D   "grid 1 3 sticky=W",
##D   "label text=File: sticky=W",
##D   "entry name=fnam mode=character width=23 value=\"\" 
##D   func=chFile entrybg=darkolivegreen1 pady=5",
##D   "button text=GO bg=green sticky=W func=test",
##D   "")
##D 
##D chFile <- function(ch=dfnam,fn="fnam") 
##D   {chooseWinVal(ch,fn,winname="choisir")};
##D 
##D #-- Example 1 GUI test
##D test <- function() {
##D   oldpar = par(no.readonly=TRUE); on.exit(par(oldpar))
##D   getWinVal(winName="choisir",scope="L")
##D   if (fnam!="" && any(fnam==dfnam)) {
##D     file <- get(fnam);
##D     pairs(file,gap=0); }
##D   else {
##D     resetGraph(); 
##D     addLabel(.5,.5,"Press <ENTER> in the green entry box
##D     \nto choose a file, then press <GO>", col="red",cex=1.5)
##D   }
##D }
##D #-- Example 2 Non-GUI test
##D #To try the non-GUI version, type 'test2()' on the command line
##D test2 <- function(fnames=dfnam) {
##D   oldpar = par(no.readonly=TRUE); on.exit(par(oldpar))
##D   frame();resetGraph()
##D   again <- TRUE;
##D   while (again) {
##D     fnam <- sample(fnames,1); file <- get(fnam); 
##D     flds <- names(file);
##D     xfld <- getChoice(paste("Pick x-field from",fnam),flds,gui=FALSE);
##D     yfld <- getChoice(paste("Pick y-field from",fnam),flds,gui=FALSE)
##D     plot(file[,xfld],file[,yfld],xlab=xfld,ylab=yfld,
##D       pch=16,cex=1.2,col="red");
##D     again <- getChoice("Plot another pair?",gui=FALSE)
##D   }
##D }
##D require(PBSmodelling)
##D createWin(wlist,astext=TRUE); test();
##D })
## End(Not run)



