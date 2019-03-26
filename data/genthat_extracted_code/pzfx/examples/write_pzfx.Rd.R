library(pzfx)


### Name: write_pzfx
### Title: Write one table or multiple tables to a 'GraphPad Prism' '.pzfx'
###   file
### Aliases: write_pzfx

### ** Examples

pzfx_file <- system.file("extdata/exponential_decay.pzfx", package = "pzfx", mustWork = TRUE)
df <- read_pzfx(pzfx_file, table = 1, strike_action = "exclude")
write_pzfx(df, path = tempfile(fileext = ".pzfx"), row_names = TRUE)



