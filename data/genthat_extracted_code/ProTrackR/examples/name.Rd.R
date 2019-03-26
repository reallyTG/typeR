library(ProTrackR)


### Name: name
### Title: Obtain or replace the name of a PTModule or PTSample
### Aliases: name name,PTSample-method name<-
###   name<-,PTSample,character-method name,PTModule-method
###   name<-,PTModule,character-method

### ** Examples

data("mod.intro")

## get the name of mod.intro:
name(mod.intro)

## I don't like the name, let's change it:
name(mod.intro) <- "I like this name better"

## Note that the provided name was too long and is truncated:
name(mod.intro)

## print all sample names in the module:
unlist(lapply(as.list(1:31), function(x)
  name(PTSample(mod.intro, x))))




