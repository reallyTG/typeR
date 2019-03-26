library(originr)


### Name: is_native
### Title: Check if a species is native somewhere
### Aliases: is_native

### ** Examples

## Not run: 
##D sp <- c("Lavandula stoechas", "Carpobrotus edulis", "Rhododendron ponticum",
##D        "Alkanna lutea", "Anchusa arvensis")
##D is_native(sp[1], where = "Islas_Baleares", region = "europe")
##D lapply(sp, is_native, where = "Continental US", region = "america")
##D lapply(sp, is_native, where = "Islas_Baleares", region = "europe")
##D 
##D # combine output for many taxa
##D res <- lapply(sp, is_native, where = "Continental US", region = "america")
##D do.call(rbind, res)
## End(Not run)



