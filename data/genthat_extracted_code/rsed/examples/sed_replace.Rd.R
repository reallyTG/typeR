library(rsed)


### Name: sed_replace
### Title: Delete or replace an entire line
### Aliases: sed_replace
### Keywords: misc

### ** Examples

################################################################################
# Let's create an example stream we can edit
################################################################################
stream <- c("Here's a line",
           "Here's a line we'll delete",
           "Filler line",
           "A line we'll delete",
           "A line we'll entirely replace",
           "The last line")
as.stream(stream)

# Here's a deletion of lines 1 and 2 using line numbers
stream <- sed_replace(stream, 1:2, NULL)
stream

# Here's a line deletion using a search string
stream <- sed_replace(stream, "A line we'll delete", NULL)
stream

# A line replacement using line numbers
stream <- sed_replace(stream, 2, "A new filler line")
stream

# Here's a line replacement with a search string
stream <- sed_replace(stream, "entirely", "A replacement for the line")
stream

# And we can replace multiple lines too
stream <- sed_replace(stream, "line", "All the same")
stream



