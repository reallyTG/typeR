library(ddpcr)


### Name: plot.wildtype_mutant_pnpp
### Title: Plot a ddPCR plate of type wildtype/mutant PNPP
### Aliases: plot.wildtype_mutant_pnpp

### ** Examples

## Not run: 
##D plate <- new_plate(sample_data_dir(), type = plate_types$fam_positive_pnpp) %>% analyze
##D wells_wildtype(plate)
##D plot(plate)
##D plate <- plate %>% analyze
##D plot(plate)
##D plot(plate, "A01:C05", col_drops_rain = "blue")
## End(Not run)



