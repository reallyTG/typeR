library(oro.nifti)


### Name: Audit Trails
### Title: Facilitate the Creation and Modification of Audit Trails
### Aliases: 'Audit Trails' oro.nifti.info enableAuditTrail newAuditTrail
###   niftiExtensionToAuditTrail niftiAuditTrailToExtension
###   niftiAuditTrailSystemNode niftiAuditTrailSystemNodeEvent
###   niftiAuditTrailCreated niftiAuditTrailEvent getLastCallWithName

### ** Examples

## A good example of the use of these functions is shown by this
## wrapper function which takes a function fun(nim, ...) returning
## lists of arrays which are nifti-ized using as(...)
options("niftiAuditTrail"=TRUE)
enableAuditTrail()

wrapper <- function(functionToWrap, nameOfCallingFunction, nim, ...) {
  if (!is(nim, "nifti")) 
    nim <- as(nim, "nifti")
  
  if (is(nim, "niftiAuditTrail")) {
    ## This will force as(...) to set the call which created the
    ## results to the calling function's call rather than
    ## as(result, nifti) as it would otherwise do
    slot(nim, "trail") <- niftiAuditTrailEvent(slot(nim, "trail"), "processing",
                                      nameOfCallingFunction)
  }
  
  result <- functionToWrap(nim, ...)
  as(result, "nifti") <- nim
  return(result)
}

## An example of how wrapper is used follows:
functionToWrap <- function(ignored, x, y) {
  return (array(1, dim=c(x,y)))
}

## The nifti-ized form
niftiizedForm <- function(nim,...) {
  return(wrapper(functionToWrap, "niftiizedForm", nim, ...))
}
 
## Not run: 
##D   if (isTRUE(getOption("niftiAuditTrail"))) {
##D     print(slot(as.nifti(functionToWrap(nifti(), 4, 4), nifti()), "trail"))
##D     print(slot(niftiizedForm(nifti(), 4, 4), "trail"))
##D   }
## End(Not run)



