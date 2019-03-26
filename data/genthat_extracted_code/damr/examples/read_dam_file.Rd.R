library(damr)


### Name: read_dam_file
### Title: Reads data from a single DAM2 single beam or a DAM5 multibeam
###   file
### Aliases: read_dam_file read_dam2_file

### ** Examples

path <- damr_example("M064.txt")
dt <- read_dam_file(path, region_id = c(1:3), start_datetime = "2017-06-30 15:00:00")
print(dt)



