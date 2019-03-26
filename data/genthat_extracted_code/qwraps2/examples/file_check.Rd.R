library(qwraps2)


### Name: file_check
### Title: File and Working Directory Check
### Aliases: file_check

### ** Examples

## Not run: 
##D # create two example files in the working directory: 
##D cat("example file.", file = "QWRAPS2_EXAMPLE_1.txt")
##D cat("Another example file.", file = "QWRAPS2_EXAMPLE_2.txt")
##D 
##D # Check that you have access to these files:  (Should return TRUE)
##D test1 <- file_check(c("QWRAPS2_EXAMPLE_1.txt", "QWRAPS2_EXAMPLE_2.txt"))
##D test1
##D 
##D # By default, when the checks return TRUE the details of the checks are not
##D # printed.  You can view the details of the checks as follows:
##D attr(test1, "checks")
##D 
##D # If one or more files is not accessable then return is FALSE and the meta data
##D # is printed by default.
##D test2 <- file_check(c("UNLIKELYFILENAME", "QWRAPS2_EXAMPLE_1.txt", "QWRAPS2_EXAMPLE_2.txt"))
##D test2
##D 
##D # Or have an error thrown:
##D file_check(c("UNLIKELYFILENAME", "QWRAPS2_EXAMPLE_1.txt", "QWRAPS2_EXAMPLE_2.txt"),
##D            stop = TRUE)
##D 
##D # Verify the md5sums as well as file access:
##D file_check("QWRAPS2_EXAMPLE_1.txt", "7a3409e17f9de067740e64448a86e708")
##D 
##D # If you only need to verify a subset of md5sums then use an NA in the md5sums
##D # argument:
##D file_check(c("QWRAPS2_EXAMPLE_1.txt", "QWRAPS2_EXAMPLE_2.txt"),
##D            c("7a3409e17f9de067740e64448a86e708", NA))
##D 
##D # Verify all the md5sums
##D file_check(c("QWRAPS2_EXAMPLE_1.txt", "QWRAPS2_EXAMPLE_2.txt"),
##D            c("7a3409e17f9de067740e64448a86e708", "798e52b92e0ae0e60f3f3db1273235d0"))
##D 
##D 
##D # clean up working directory
##D unlink("QWRAPS2_EXAMPLE_1.txt")
##D unlink("QWRAPS2_EXAMPLE_2.txt")
##D 
## End(Not run)




