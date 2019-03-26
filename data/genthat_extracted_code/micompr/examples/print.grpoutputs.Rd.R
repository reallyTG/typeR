library(micompr)


### Name: print.grpoutputs
### Title: Print information about grouped outputs
### Aliases: print.grpoutputs

### ** Examples

# Determine paths for data folders, each containing outputs for 10 runs of
# the PPHPC model
dir_nl_ok <- system.file("extdata", "nl_ok", package = "micompr")
dir_jex_diff <- system.file("extdata", "j_ex_diff", package = "micompr")
files <- glob2rx("stats400v1*.tsv")

# Create a grpoutputs object
go <- grpoutputs(6, c(dir_nl_ok, dir_jex_diff), c(files, files))

# Print information about object (could just type "go" instead)
print(go)




