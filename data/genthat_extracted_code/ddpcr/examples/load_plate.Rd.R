library(ddpcr)


### Name: load_plate
### Title: Load a previously saved ddPCR plate
### Aliases: load_plate

### ** Examples

plate <- new_plate(sample_data_dir())
save_plate(plate, "myplate")
plate2 <- load_plate("myplate")
plate3 <- load_plate("myplate.rds")
identical(plate, plate2)
identical(plate, plate3)
unlink("myplate.rds")



