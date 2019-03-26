library(Luminescence)


### Name: PSL2Risoe.BINfileData
### Title: Convert portable OSL data to an Risoe.BINfileData object
### Aliases: PSL2Risoe.BINfileData
### Keywords: IO

### ** Examples


# (1) load and plot example data set
data("ExampleData.portableOSL", envir = environment())
plot_RLum(ExampleData.portableOSL)

# (2) merge all RLum.Analysis objects into one
merged <- merge_RLum(ExampleData.portableOSL)
merged

# (3) convert to RisoeBINfile object
bin <- PSL2Risoe.BINfileData(merged)
bin

# (4) write Risoe BIN file
## Not run: 
##D write_R2BIN(bin, "~/portableOSL.binx")
## End(Not run)




