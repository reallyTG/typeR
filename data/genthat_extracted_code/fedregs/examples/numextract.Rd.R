library(fedregs)


### Name: numextract
### Title: Extract the Part Numbers
### Aliases: numextract
### Keywords: internal

### ** Examples

## No test: 
part_vec <- cfr_urls(year = 2017, title_number = 50)
parts <- cfr_part(part_vec[1])
numextract(parts$parts, return = "max")
## End(No test)




