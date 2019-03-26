library(shiny)


### Name: runExample
### Title: Run Shiny Example Applications
### Aliases: runExample

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  # List all available examples
  runExample()

  # Run one of the examples
  runExample("01_hello")

  # Print the directory containing the code for all examples
  system.file("examples", package="shiny")
}



