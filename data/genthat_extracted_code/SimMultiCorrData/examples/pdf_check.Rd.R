library(SimMultiCorrData)


### Name: pdf_check
### Title: Check Polynomial Transformation Constants for Valid Power Method
###   PDF
### Aliases: pdf_check
### Keywords: Fleishman, Headrick constants,

### ** Examples

# Normal distribution
pdf_check(c(0, 1, 0, 0, 0, 0), "Polynomial")

## Not run: 
##D # Chi-squared (df = 1) Distribution (invalid power method pdf)
##D con <- find_constants(method = "Polynomial", skews = sqrt(8), skurts = 12,
##D                       fifths = 48*sqrt(2), sixths = 480)$constants
##D pdf_check(c = con, method = "Polynomial")
##D 
##D # Beta (a = 4, b = 2) Distribution (valid power method pdf)
##D con <- find_constants(method = "Polynomial", skews = -0.467707,
##D                       skurts = -0.375, fifths = 1.403122,
##D                       sixths = -0.426136)$constants
##D pdf_check(c = con, method = "Polynomial")
##D 
## End(Not run)



