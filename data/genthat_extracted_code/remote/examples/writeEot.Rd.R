library(remote)


### Name: writeEot
### Title: Write Eot* objects to disk
### Aliases: writeEot writeEot,EotMode-method writeEot,EotStack-method

### ** Examples

data(vdendool)

nh_modes <- eot(x = vdendool, y = NULL, n = 2, 
                standardised = FALSE, 
                verbose = TRUE)

## write the complete EotStack
writeEot(nh_modes, prefix = "vdendool")

## write only one EotMode
writeEot(nh_modes[[2]], prefix = "vdendool")




