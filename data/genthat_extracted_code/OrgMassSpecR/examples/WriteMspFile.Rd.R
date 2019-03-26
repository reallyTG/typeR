library(OrgMassSpecR)


### Name: WriteMspFile
### Title: Write Spectra to the NIST MSP Text Format
### Aliases: WriteMspFile

### ** Examples

## Simple example to illustrate the input data formats. 

spectra <- data.frame(filename = c(rep("Spectrum A", 2), rep("Spectrum B", 2)),
                      mz = c(50, 51, 100, 101),
                      intensity = c(70, 71, 90, 91))

metadata <- data.frame(filename = c("Spectrum A", "Spectrum B"),
                       compound = c("Compound A", "Compound B"))

## Not run: 
##D WriteMspFile(spectra = spectra, 
##D              metadata = metadata,
##D              filename = "Test.txt",
##D              comment = "Test Comment")
## End(Not run)

## Example using SpecLibExample package located at http://OrgMassSpec.github.io/libraries.html.
## Not run: 
##D library(SpecLibExample)
##D WriteMspFile(spectra = spec,
##D              metadata = meta,
##D              comment = "example output")
## End(Not run)



