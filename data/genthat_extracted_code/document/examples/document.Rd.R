library(document)


### Name: document
### Title: Document (Chunks of) an R Code File
### Aliases: document

### ** Examples

## No test: 
res <- document(file_name = system.file("files", "minimal.R",
                                        package = "document"),
                check_package = FALSE) # this is for the sake of CRAN cpu
                # time only. _Always_ stick with the default!

# View R CMD check results. If we had set check_package to TRUE in the above
# example, we now could retrieve the check results via:
cat(res[["check_result"]][["output"]][["stdout"]], sep = "\n")
cat(res[["check_result"]][["output"]][["stderr"]], sep = "\n")

# Copy docmentation to current working directory.
# This writes to your disk, so it's disabled.
# Remove or comment out the next line to enable.
if (FALSE)
    file.copy(res[["pdf_path"]], getwd())
## End(No test)



