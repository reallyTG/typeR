library(netdiffuseR)


### Name: classify_adopters
### Title: Classify adopters accordingly to Time of Adoption and Threshold
###   levels.
### Aliases: classify_adopters classify classify_adopters.diffnet
###   classify_adopters.default ftable.diffnet_adopters
###   as.data.frame.diffnet_adopters plot.diffnet_adopters

### ** Examples

# Classifying brfarmers -----------------------------------------------------

x <- brfarmersDiffNet
diffnet.toa(x)[x$toa==max(x$toa, na.rm = TRUE)] <- NA
out <- classify_adopters(x)

# This is one way
round(
with(out, ftable(toa, thr, dnn=c("Time of Adoption", "Threshold")))/
  nnodes(x[!is.na(x$toa)])*100, digits=2)

# This is other
ftable(out)

# Can be coerced into a data.frame, e.g. ------------------------------------
## Not run: 
##D  View(classify(brfarmersDiffNet))
##D  cbind(as.data.frame(classify(brfarmersDiffNet)), brfarmersDiffNet$toa)
## End(Not run)

# Creating a mosaic plot with the medical innovations -----------------------
x <- classify(medInnovationsDiffNet)
plot(x)




