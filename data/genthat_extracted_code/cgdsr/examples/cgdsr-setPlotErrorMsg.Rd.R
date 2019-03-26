library(cgdsr)


### Name: cgdsr-setPlotErrorMsg
### Title: Set custom plot error message
### Aliases: cgdsr-setPlotErrorMsg setPlotErrorMsg setPlotErrorMsg.CGDS

### ** Examples

# Create CGDS object
mycgds = CGDS("http://www.cbioportal.org/")

getCancerStudies(mycgds)

# Set custom error plot message
setPlotErrorMsg(mycgds, 'My message ...')

getCancerStudies(mycgds)




