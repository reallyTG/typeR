library(DoE.base)


### Name: export.design
### Title: Function for exporting a design object
### Aliases: export.design html html.data.frame
### Keywords: array design

### ** Examples

  ## six 2-level factors
  test <- oa.design(nlevels=c(2,3,3,3))
  ## export an html file with legend and two responses
  ## files test.rda and test.html will be written to the current working directory, 
  ##     if they do not exist yet
  export.design(test, response.names=c("pressure", "temperature"))



