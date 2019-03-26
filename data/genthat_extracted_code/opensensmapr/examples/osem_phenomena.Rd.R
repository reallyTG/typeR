library(opensensmapr)


### Name: osem_phenomena
### Title: Get the counts of sensors for each observed phenomenon.
### Aliases: osem_phenomena osem_phenomena.sensebox

### ** Examples

# get the phenomena for a single senseBox
osem_phenomena(osem_box('593bcd656ccf3b0011791f5a'))

## No test: 
  # get the phenomena for a group of senseBoxes
  osem_phenomena(
    osem_boxes(grouptag = 'ifgi', exposure = 'outdoor', date = Sys.time())
  )

  # get phenomena with at least 30 sensors on opensensemap
  phenoms = osem_phenomena(osem_boxes())
  names(phenoms[phenoms > 29])
## End(No test)



