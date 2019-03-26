library(multicon)


### Name: composite
### Title: Composite
### Aliases: composite
### Keywords: composite

### ** Examples

data(RSPdata)
names(RSPdata)
# Forming a composite:
  # We will form a composite extraversion variable using BFI scores.
    # First put the variables into one data.frame
ext.vars <- data.frame(RSPdata$sBFI1, RSPdata$sBFI6, RSPdata$sBFI11,
	RSPdata$sBFI16, RSPdata$sBFI21, RSPdata$sBFI26, RSPdata$sBFI31, RSPdata$sBFI36)
head(ext.vars) # Looks good
    # Three items need to be reverse scored
ext.comp <- composite(ext.vars, R = c(2,5,7), rel = TRUE)
ext.comp
    # Let's say we want to include the CAQ item "04 - Is a talkative Individual" in our
    # extraversion composite. But is is measured on a 1 to 9 scale while the BFI variables
    # are measured on a 1 to 5 scale. We should set Zitems=TRUE to Z-score all of the
    # items before compositing.
ext.comp2 <- composite(data.frame(ext.vars, RSPdata$sCAQ004), 
	R = c(2,5,7), rel= TRUE, Zitems = TRUE)
describe(ext.comp2) # mean is zero
  



