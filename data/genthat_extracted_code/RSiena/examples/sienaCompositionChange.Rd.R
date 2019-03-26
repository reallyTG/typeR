library(RSiena)


### Name: sienaCompositionChange
### Title: Functions to create a Siena composition change object
### Aliases: sienaCompositionChange sienaCompositionChangeFromFile
### Keywords: classes

### ** Examples

  clist <- list(c(1, 3), c(1.4, 2.5))
  #or
  clist <- list(c("1", "3"), c("1.4", "2.5"))

  compChange <- sienaCompositionChange(clist)

  s50net <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
  s50list <- rep(list(c(1,3)), 50)
  # This is a trivial composition change: all actors are present in all waves.
  compChange <- sienaCompositionChange(s50list)
  s50data <- sienaDataCreate(s50net, compChange)
  s50data

  ## Not run: 
##D   filedata <- c("1 3", "1.4 2.5")
##D   write.table(filedata, "cc.dat",row.names=FALSE, col.names=FALSE,
##D           quote=FALSE)
##D   ## file will be
##D   ## 1 3
##D   ## 1.4 2.5
##D   compChange <- sienaCompositionChangeFromFile("cc.dat")
##D   
## End(Not run)



