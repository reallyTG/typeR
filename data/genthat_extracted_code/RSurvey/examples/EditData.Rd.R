library(RSurvey)


### Name: EditData
### Title: GUI: Data Editor
### Aliases: EditData
### Keywords: misc

### ** Examples

## Not run: 
##D   tcltk::tclRequire("Tktable", warn = TRUE)
##D 
##D   n <- 1000L
##D   V1 <- sample(c(1:9, NA), n, replace = TRUE)
##D   V2 <- sample(LETTERS, n, replace = TRUE)
##D   V3 <- as.POSIXct(rnorm(n, mean = 0, sd = 1e6), origin = "2010-01-01")
##D   V4 <- sample(V1 * pi, n)
##D   d <- data.frame(V1, V2, V3, V4)
##D   col.names <- c("Integers", "Letters", "DateTime", "Numeric")
##D   col.formats <- c("%d", "%s", "%m/%d/%Y %H:%M", "")
##D   obj <- EditData(d, col.names, col.formats)
##D   str(obj)
##D 
##D   rownames(d) <- paste0(sample(LETTERS, n, replace = TRUE), seq_len(n))
##D   EditData(d, read.only = TRUE)
##D 
##D   colnames(d) <- NULL
##D   rownames(d) <- NULL
##D   EditData(d, read.only = TRUE)
## End(Not run)




