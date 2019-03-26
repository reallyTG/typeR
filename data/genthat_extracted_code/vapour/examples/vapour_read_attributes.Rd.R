library(vapour)


### Name: vapour_read_attributes
### Title: Read feature attribute data
### Aliases: vapour_read_attributes

### ** Examples

file <- "list_locality_postcode_meander_valley.tab"
mvfile <- system.file(file.path("extdata/tab", file), package="vapour")
att <- vapour_read_attributes(mvfile)
str(att)
sq <- "SELECT * FROM list_locality_postcode_meander_valley WHERE FID < 5"
(att <- vapour_read_attributes(mvfile, sql = sq))
pfile <- "list_locality_postcode_meander_valley.tab"
dsource <- system.file(file.path("extdata/tab", pfile), package="vapour")
SQL <- "SELECT NAME FROM list_locality_postcode_meander_valley WHERE POSTCODE < 7300"
vapour_read_attributes(dsource, sql = SQL)



