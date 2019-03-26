library(meta)


### Name: print.meta
### Title: Print and summary method for objects of class meta
### Aliases: print.meta print.metabias summary.meta print.summary.meta
###   cilayout
### Keywords: print

### ** Examples

data(Fleiss93cont)
meta1 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c,
                  data=Fleiss93cont, sm="SMD",
                  studlab=paste(study, year))
summary(meta1)

summary(update(meta1, byvar=c(1,2,1,1,2), bylab="group"))

forest(update(meta1, byvar=c(1,2,1,1,2), bylab="group"))

## Not run: 
##D # Use unicode characters to print tau^2 and I^2 
##D #
##D print(summary(meta1), text.tau2="\u03c4\u00b2", text.I2="I\u00b2")
## End(Not run)



