library(Smisc)


### Name: hardCode
### Title: Facilitate hard coding constants into R
### Aliases: hardCode

### ** Examples

# With characters
hardCode(letters[1])
hardCode(letters[1:3], vname = "new")
hardCode(letters[1], vert = FALSE)
hardCode(letters[1:3], vert = FALSE, vname = "new")

# With numbers
hardCode(3:5)
hardCode(3:5, vert = FALSE, vname = "num")

# With logicals
hardCode(TRUE)
hardCode(c(FALSE, TRUE), vert = FALSE)
hardCode(c(TRUE, FALSE, TRUE), vname = "newLogical")



