library(brew)


### Name: brew
### Title: Report Brewing For Text and R Output
### Aliases: brew
### Keywords: utilities

### ** Examples


## A port of the Sweave test file.
brew(system.file("brew-test-1.brew",package="brew"),"brew-test-1.tex",envir=new.env())

## Everything you wanted to know about your R session.
brew(system.file("brew-test-2.brew",package="brew"),"brew-test-2.html",envir=new.env())
browseURL(paste('file://',file.path(getwd(),'brew-test-2.html'),sep=''))

## Don't sully up environment, so use envir=new.env(). Nested brew calls will still work.
brew(system.file("example1.brew",package="brew"),envir=new.env())

## Various ways to print R output 
library(datasets)
brew(system.file("catprint.brew",package="brew"),envir=new.env())
rm(iris)

## The example from the Details section
brew(system.file("featurefull.brew",package="brew"),envir=new.env())

## Using the tplParser argument
tParse <- function(text) paste('Got this: <',text,'>\n',sep='',collapse='')
brew(system.file("featurefull.brew",package="brew"),envir=new.env(),tplParser=tParse)
rm(tParse)



