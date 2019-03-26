library(micompr)


### Name: grpoutputs
### Title: Load and group outputs from files
### Aliases: grpoutputs

### ** Examples

# Determine paths for data folders, each containing outputs for 10 runs of
# the PPHPC model
dir_nl_ok <- system.file("extdata", "nl_ok", package = "micompr")
dir_jex_ok <- system.file("extdata", "j_ex_ok", package = "micompr")
files <- glob2rx("stats400v1*.tsv")

# Create a grouped outputs object using outputs from NetLogo and Java
# implementations of the PPHPC model
go <- grpoutputs(7, c(dir_nl_ok, dir_jex_ok), c(files, files),
                 lvls = c("NL", "JEX"), concat = TRUE)

# Do the same, but specify output names and don't specify levels
go <- grpoutputs(c("a", "b", "c", "d", "e", "f"),
                 c(dir_nl_ok, dir_jex_ok), c(files, files))



