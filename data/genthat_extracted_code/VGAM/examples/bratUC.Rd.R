library(VGAM)


### Name: Brat
### Title: Inputting Data to fit a Bradley Terry Model
### Aliases: Brat
### Keywords: models regression

### ** Examples

journal <- c("Biometrika", "Comm Statist", "JASA", "JRSS-B")
mat <- matrix(c( NA, 33, 320, 284,   730, NA, 813, 276,
                498, 68,  NA, 325,   221, 17, 142, NA), 4, 4)
dimnames(mat) <- list(winner = journal, loser = journal)
Brat(mat)  # Less readable
Brat(mat, whitespace = TRUE)  # More readable
vglm(Brat(mat, whitespace = TRUE) ~ 1, brat, trace = TRUE)



