library(pvsR)


### Name: Officials.getByOfficeTypeState
### Title: Get a list of officials according to office type and state
### Aliases: Officials.getByOfficeTypeState

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
# Note that some officeTypeIds are only available on the state level or national level
# (e.g. "L" for State Legislature only if stateId is specified!)
## Not run: pvs.key <- "yourkey"
# get a list of officials by state and office type
## Not run: CAlegislators <- Officials.getByOfficeTypeState(officeTypeId="L", stateId="CA")
## Not run: head(CAlegislators)
## Not run: suprcourt <- Officials.getByOfficeTypeState(officeTypeId="J")
## Not run: head(suprcourt)



