library(rsed)


### Name: sed_comment
### Title: Add or remove comment characters to a line
### Aliases: sed_comment
### Keywords: misc

### ** Examples

######################################################################
# Let's create a stream to demonstrate the commenting symbol in each
# language
######################################################################
demoStream <- c("An R comment",
               "A C comment",
               "An html comment",
               "A tex comment",
               "A SAS comment",
               "A custom comment")

a <- sed_comment(demoStream, "R", type = "R")
a <- sed_comment(a, "C", type = "C")
a <- sed_comment(a, "html", type = "h")
a <- sed_comment(a, "tex", type = "t")
a <- sed_comment(a, "SAS", type = "S")
a <- sed_comment(a, "custom", type = c("&", ";"))

# Compare before and after
as.stream(demoStream)
a

######################################################################
# Various examples
######################################################################
aStream <- c("Here's a line to comment",
            "# A line to uncomment",
            "  <!-- Another commented line --> ",
            "And some comments * embedded in the line ;")
as.stream(aStream)

# Comment the first line in C style
stream <- sed_comment(aStream, "to comment", type = "C")

# Comment the first line with a custom style
a <- sed_comment(aStream, "to comment", type = c("&&", "##"))
a

# Remove the custom comments
a <- sed_comment(a, 1, add = FALSE, type = c("&&", "##"))
a

# Remove the R comment from the 2nd line
a <- sed_comment(a, 2, add = FALSE, type = "R")
a

# Remove the html comments
a <- sed_comment(a, "Another", add = FALSE, type = "html")
a

# Remove the SAS comments
sed_comment(a, "embedded", add = FALSE, type = "SAS")

# Comment every line in Java style
b <- sed_comment(aStream, "comment", type = "Java")
b

# Remove the Java comments from the second and fourth lines
sed_comment(b, c(2, 4), add = FALSE, type = "Java")



