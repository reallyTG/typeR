library(gapfill)


### Name: Score
### Title: Score Columns of a Matrix Containing NAs by its Values
### Aliases: Score

### ** Examples

mat <- rbind(c( 1,  2, NA),
             c(NA, NA,  1),
             c( 2, NA,  3),
             c( 1,  5, NA),
             c(NA,  2,  5))
s <- Score(mat)

## manual calculation in R
Mean <- function(x) mean(x, na.rm = TRUE)
sByHand <- c(Mean(c(Mean(mat[,1] > mat[,2]),
                    Mean(mat[,1] > mat[,3]))),
             Mean(c(Mean(mat[,2] > mat[,1]),
                    Mean(mat[,2] > mat[,3]))),
             Mean(c(Mean(mat[,3] > mat[,1]),
                    Mean(mat[,3] > mat[,2]))))
stopifnot(identical(s, sByHand))




