library(plotrix)


### Name: add.ps
### Title: add p-values from t-tests
### Aliases: add.ps

### ** Examples

## Not run: 
##D #The examples uses the OBrienKaiser dataset from car and needs reshape.
##D # This extends the examples from raw.means.plot
##D require(reshape)
##D require(car)
##D data(OBrienKaiser)
##D OBKnew <- cbind(factor(1:nrow(OBrienKaiser)), OBrienKaiser)
##D colnames(OBKnew)[1] <- "id"
##D OBK.long <- melt(OBKnew)
##D OBK.long[, c("measurement", "time")] <-
##D  t(vapply(strsplit(as.character(OBK.long$variable), "\\."),  "[", c("", "")))
##D 
##D # For this example the position at each x-axis are within-subject comparisons!
##D raw.means.plot2(OBK.long, "id", "measurement", "gender", "value")
##D  add.ps(OBK.long, "id", "measurement", "gender", "value", paired = TRUE)
##D  #reference is "fup"
##D 
##D raw.means.plot2(OBK.long, "id", "measurement", "gender", "value")
##D add.ps(OBK.long, "id", "measurement", "gender", "value", ref.offset = 2,
##D  paired = TRUE) #reference is "post"
##D 
##D # Use R's standard (i.e., Welch test)
##D raw.means.plot2(OBK.long, "id", "treatment", "gender", "value")
##D add.ps(OBK.long, "id", "treatment", "gender", "value",
##D  prefixes = c("p(control vs. A)", "p(control vs. B)"))
##D 
##D # Use standard t-test
##D raw.means.plot2(OBK.long, "id", "treatment", "gender", "value")
##D add.ps(OBK.long, "id", "treatment", "gender", "value", var.equal = TRUE,
##D  prefixes = c("p(control vs. A)", "p(control vs. B)"))
##D 
## End(Not run)



