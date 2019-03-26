library(ddpcr)


### Name: save_plate
### Title: Save a ddPCR plate
### Aliases: save_plate

### ** Examples

plate <- new_plate(sample_data_dir())
save_plate(plate, "myplate")
unlink("myplate.rds")



