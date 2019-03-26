library(rsed)


### Name: sed_insert
### Title: Insert one or more lines
### Aliases: sed_insert
### Keywords: misc

### ** Examples

################################################################################
# Let's create an example stream we can edit
################################################################################
stream <- c("Here's a line",
           "And another line",
           "Line after which we'll insert a string",
           "A line after which we'll insert another string",
           "A final line")
as.stream(stream)

# Insert a string using line numbers
stream <- sed_insert(stream, after = 3, "Here's the first insertion")
stream

# Insert a stream by searching for a string
stream <- sed_insert(stream,
                    c("Here's the second insertion",
                      "",
                      "Another line of the second insertion after the blank line"),
                    after = "insert another")
stream



