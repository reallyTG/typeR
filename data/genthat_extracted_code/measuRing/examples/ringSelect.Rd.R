library(measuRing)


### Name: ringSelect
### Title: Visual selection
### Aliases: ringSelect

### ** Examples

## Read one image in package folder:
image1 <- system.file("P105_a.tif", package="measuRing")
## (not run) Initial diagnostic:
detect1 <- ringDetect(image1,segs=2,marker=7)
##
## (not run) Choose other columns in gray matrix (see ringSelect);
## (not run) graphical devices from ringDetect should be active!
## (not run) Including columns:
##
## (uncomment and run):
## Toinc <- ringSelect(detect1)
## detect1 <- update(detect1, inclu = Toinc)
##
## (not run)  ring borders to be excluded:
## (uncomment and run):
## Toexc <- ringSelect(detect1,any.col = FALSE)
## detect1 <- update(detect1, exclu=Toexc)
## (not run) kill previous plot:
graphics.off()



