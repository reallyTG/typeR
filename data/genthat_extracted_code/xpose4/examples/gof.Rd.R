library(xpose4)


### Name: gof
### Title: Structured goodness of fit diagnostics.
### Aliases: gof gofSetup xpPage
### Keywords: methods

### ** Examples


## Not run: 
##D ## This is an example of how the function may be setup by a user.
##D 
##D library(xpose4)
##D mygof <- gof
##D fix(mygof)
##D 
##D myggof <- function (runno = NULL, save = FALSE, onefile = FALSE, saveType = "pdf", 
##D          pageWidth = 7.6, pageHeight = 4.9, structural = TRUE, residual = TRUE, 
##D          covariate = FALSE, iiv = FALSE, iov = FALSE, all = FALSE, myTrace=xpPage) {
##D 
##D          gofSetup(runno, save, onefile, saveType, pageWidth, pageHeight)
##D          xpdb <- xpose.data(runno)
##D 
##D          if (structural || all) {
##D           xplot <- dv.vs.pred.ipred(xpdb, page = myPage)
##D           print(xplot)
##D          }
##D          if (residual || all) {
##D           xplot <- absval.wres.vs.pred(xpdb, page = myPage)
##D           print(xplot)
##D          }
##D          if (covariate || all) {
##D          }
##D          if (iiv || all) {
##D          }
##D          if (iov || all) {
##D          }
##D          if (save) dev.off()
##D     invisible()
##D   }
##D 
##D ## The function can then be execute, e.g.:
##D mygof(1)
##D 
## End(Not run)




