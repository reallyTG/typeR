library(nzilbb.labbcat)


### Name: labbcat.getSoundFragment
### Title: Gets a sound fragment from 'LaBB-CAT'.
### Aliases: labbcat.getSoundFragment
### Keywords: fragment sample sound wav

### ** Examples

## Not run: 
##D ## Connect to LaBB-CAT
##D labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")
##D 
##D ## Get the 5 seconds starting from 10s after the beginning of a recording
##D wav.file <- labbcat.getSoundFragment(labbcat, "AP2505_Nelson.eaf", 10.0, 15.0)
##D 
##D ## Get the 5 seconds starting from 10s as a mono 22kHz file
##D wav.file <- labbcat.getSoundFragment(labbcat, "AP2505_Nelson.eaf", 10.0, 15.0, 22050)
##D 
##D ## Get a list of fragments
##D results <- data.frame(
##D              id=c("AP2505_Nelson.eaf", "AP2512_MattBlack.eaf", "AP2512_MattBlack.eaf"),
##D              start=c(10.0, 20.0, 30.0),
##D              end=c(15.0, 25.0, 35.0))
##D wav.files <- labbcat.getSoundFragment(labbcat, results$id, results$start, results$end)
##D 
##D ## Get a list of fragments with no prgress bar
##D wav.file <- labbcat.getSoundFragment(
##D               labbcat, results$id, results$start, results$end, no.progress=TRUE)
## End(Not run)



