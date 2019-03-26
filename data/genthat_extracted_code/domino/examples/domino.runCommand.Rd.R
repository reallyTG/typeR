library(domino)


### Name: domino.runCommand
### Title: domino.runCommand
### Aliases: domino.runCommand
### Keywords: command

### ** Examples

## Not run: 
##D success <- function() {
##D print("Success!")
##D }
##D domino.runCommand("run main.R 1 2 3",success, "failed to succeed")
##D # Runs command "run main.R 1 2 3" and 
##D # calls 'success' function if domino command ends successfuly.
##D # Prints error message  - "failed to succeed" if domino command fails.
## End(Not run)




