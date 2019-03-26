library(ape)


### Name: write.nexus.data
### Title: Write Character Data in NEXUS Format
### Aliases: write.nexus.data
### Keywords: file

### ** Examples

## Not run: 
##D ## Write interleaved DNA data with 100 characters per line in a DATA block
##D data(woodmouse)
##D write.nexus.data(woodmouse, file= "wood.ex.nex", interleaved = TRUE, charsperline = 100)
##D ## Write sequential DNA data in TAXA and CHARACTERS blocks
##D data(cynipids)
##D write.nexus.data(cynipids, file = "cyn.ex.nex", format = "protein",
##D                  datablock = FALSE, interleaved = FALSE)
##D unlink(c("wood.ex.nex", "cyn.ex.nex"))
## End(Not run)


