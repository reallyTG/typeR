library(rsed)


### Name: sed_substitute
### Title: Substitute one string for another
### Aliases: sed_substitute
### Keywords: misc

### ** Examples

################################################################################
# Let's create an example stream we can edit
################################################################################
stream <- c("Here's a line",
           "A line where we'll make a substitution",
           "A line where we'll delete 'this'",
           "Several nonsense nonsense repeated strings nonsense",
           "Another nonsense line with nonsense repeated strings",
           "The last line")
as.stream(stream)

# Here's a deletion within the line
stream <- sed_substitute(stream, " 'this'", "")
stream

# Here's a substitution of text
stream <- sed_substitute(stream, "substitution", "correction")
stream

# Show the difference between 'every = TRUE' and 'every = FALSE'
sed_substitute(stream, " nonsense", "", every = TRUE)
sed_substitute(stream, " nonsense", "", every = FALSE)



