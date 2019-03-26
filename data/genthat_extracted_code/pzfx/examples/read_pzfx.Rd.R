library(pzfx)


### Name: read_pzfx
### Title: Read one table from a 'GraphPad Prism' '.pzfx' file
### Aliases: read_pzfx

### ** Examples

pzfx_file <- system.file("extdata/exponential_decay.pzfx", package = "pzfx", mustWork = TRUE)
read_pzfx(pzfx_file, table = 1, strike_action="exclude")



