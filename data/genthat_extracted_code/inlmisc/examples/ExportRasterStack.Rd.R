library(inlmisc)


### Name: ExportRasterStack
### Title: Export a Raster Stack
### Aliases: ExportRasterStack
### Keywords: IO

### ** Examples

## Not run: 
##D rs <- raster::stack(system.file("external/rlogo.grd", package = "raster"))
##D print(rs)
##D path <- file.path(tempdir(), "rlogo")
##D dir.create(path)
##D ExportRasterStack(rs, path)
##D list.files(normalizePath(path, winslash = "/"), full.name = TRUE,
##D            recursive = TRUE, include.dirs = TRUE)
##D 
##D unlink(path, recursive = TRUE)
## End(Not run)




