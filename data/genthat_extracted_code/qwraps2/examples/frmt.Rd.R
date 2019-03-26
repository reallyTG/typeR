library(qwraps2)


### Name: frmt
### Title: Format Wrappers
### Aliases: frmt frmtp frmtci

### ** Examples


# Formatting numbers
integers <- c(1234L, 9861230L)
numbers  <- c(1234,  9861230)
frmt(integers)  # no decimal point
frmt(numbers)   # decimal point and zeros to the right

numbers <- c(0.1234, 0.1, 1234.4321, 0.365, 0.375)
frmt(numbers)

# Formatting p-values
ps <- c(0.2, 0.001, 0.00092, 0.047, 0.034781, 0.0000872, 0.787, 0.05, 0.043)
# LaTeX is the default markup language
cbind("raw"      = ps, 
      "default"  = frmtp(ps), 
      "3lower"   = frmtp(ps, digits = 3, case = "lower"),
      "PediDent" = frmtp(ps, style = "pediatric_dentistry"))

# Using markdown
cbind("raw"      = ps, 
      "default"  = frmtp(ps, markup = "markdown"), 
      "3lower"   = frmtp(ps, digits = 3, case = "lower", markup = "markdown"),
      "PediDent" = frmtp(ps, style = "pediatric_dentistry", markup = "markdown"))

# Formatting the point estimate and confidence interval
# for a set of three values
temp <- c(a = 1.23, b = .32, CC = 1.78)
frmtci(temp) 
frmtci(temp, show_level = TRUE) 

# note that the show_level will be ignored in the following
frmtci(temp, format = "est ***lcl, ucl***", show_level = TRUE)

# show_level as a character
frmtci(temp, show_level = "confidence between: ")

# For a matrix: the numbers in this example don't mean anything, but the
# formatting should.
temp2 <- matrix(rnorm(12), nrow = 4, 
                dimnames = list(c("A", "B", "C", "D"), c("EST", "LOW", "HIGH")))
temp2
frmtci(temp2)



