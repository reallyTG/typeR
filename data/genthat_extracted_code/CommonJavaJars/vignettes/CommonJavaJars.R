## ----echo=FALSE,results='hide'------------------------------------------------------------------------------------------------------------

options(width=140)
options(prompt=" ", continue=" ")
options(digits=4)


## ----echo=TRUE,eval=F---------------------------------------------------------------------------------------------------------------------
#  
#  .jpackage("CommonJavaJars", jars=c("forms-1.2.0.jar", "iText-2.1.4.jar"))
#  

## ----echo=TRUE,eval=F---------------------------------------------------------------------------------------------------------------------
#  
#  loadJars(c("forms", "iText"))
#  

## ----echo=TRUE,eval=FALSE-----------------------------------------------------------------------------------------------------------------
#  # The following few lines are based on the code of the rJava .jpackage function
#  if (!is.null(sessionInfo()$otherPkgs$rJava$Version) && sessionInfo()$otherPkgs$rJava$Version < "0.8-3") {
#  	classes <- system.file("R28", package = "CommonJavaJars", lib.loc = NULL)
#  	if (nchar(classes)) {
#  		.jaddClassPath(classes)
#  		jars <- grep(".*\\.jar", list.files(classes, full.names = TRUE), TRUE, value = TRUE)
#  		if (length(jars)) {
#  			.jaddClassPath(jars)
#  		}		
#  	}
#  }
#  # Otherwise load from rJava.

