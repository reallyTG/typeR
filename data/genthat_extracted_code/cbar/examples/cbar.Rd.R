library(cbar)


### Name: cbar
### Title: 'cbar' package
### Aliases: cbar cbar-package cbar

### ** Examples

library(cbar)

.data <- mtcars
rownames(.data) <- NULL
datetime <- seq(from = Sys.time(), length.out = nrow(.data), by = "mins")
.data <- cbind(datetime = datetime, .data)

ref_session <- 1:16
mea_session <- 17:nrow(.data)

obj <- cbar(.data, ref_session, mea_session)



