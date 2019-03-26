library(TRAMPR)


### Name: combine.TRAMPsamples
### Title: Combine TRAMPsamples Objects
### Aliases: combine.TRAMPsamples
### Keywords: manip

### ** Examples

data(demo.samples)

## Let's split the original samples database in two, and recombine.
demo.samples.a <- demo.samples[head(labels(demo.samples), 10)]
demo.samples.b <- demo.samples[tail(labels(demo.samples), 10)]

## Combining these is easy:
demo.samples.c <- combine.TRAMPsamples(demo.samples.a, demo.samples.b)

## There is a warning message because demo.samples.b contains extra
## elements:
names(demo.samples.b)

## In this case, these objects should not be combined, but in other
## cases it may be necessary to rbind() the extra objects together:
## Not run: 
##D demo.samples.c$soilcore <- rbind(demo.samples.a$soilcore,
##D                                  demo.samples.b$soilcore)
## End(Not run)

## This must be done manually, since there is no way of telling what
## should be done automatically.  Ideas/contributions are welcome here.



