library(svMisc)


### Name: batch
### Title: Run a function in batch mode
### Aliases: batch
### Keywords: utilities

### ** Examples

# Here is a fake batcheable process
fake_process <- function(file) {
  message("Processing ", file, "...")
  flush.console()
  Sys.sleep(0.5)
  if (runif(1) > 0.7) { # Fails
    warning("fake_process was unable to process ", file)
    invisible(FALSE)
  } else invisible(TRUE)
}

# Run it in batch mode on five items
files <- paste0("file", 1:5)
batch(files, fake_process)



