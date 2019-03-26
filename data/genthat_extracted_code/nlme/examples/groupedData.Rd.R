library(nlme)


### Name: groupedData
### Title: Construct a groupedData Object
### Aliases: groupedData nfGroupedData nmGroupedData [.groupedData
###   as.data.frame.groupedData update.groupedData
### Keywords: manip attribute

### ** Examples

Orth.new <-  # create a new copy of the groupedData object
  groupedData( distance ~ age | Subject,
              data = as.data.frame( Orthodont ),
              FUN = mean,
              outer = ~ Sex,
              labels = list( x = "Age",
                y = "Distance from pituitary to pterygomaxillary fissure" ),
              units = list( x = "(yr)", y = "(mm)") )
## Not run: 
##D plot( Orth.new )         # trellis plot by Subject
## End(Not run)
formula( Orth.new )      # extractor for the formula
gsummary( Orth.new )     # apply summary by Subject
fm1 <- lme( Orth.new )   # fixed and groups formulae extracted from object
Orthodont2 <- update(Orthodont, FUN = mean)



