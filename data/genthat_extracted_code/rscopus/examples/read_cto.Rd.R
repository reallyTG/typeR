library(rscopus)


### Name: read_cto
### Title: Read Citation Overview (CTO) File
### Aliases: read_cto read_cto_long

### ** Examples

file = system.file("extdata", "CTOExport.csv", package = "rscopus")
citations_over_time = read_cto(file)
citations_over_time = citations_over_time$data



