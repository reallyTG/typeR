library(DJL)


### Name: roc.malmquist
### Title: Malmquist Index: time-series productivity analysis
### Aliases: roc.malmquist

### ** Examples

# Load data
  df <- array(c(4,     3,   9,  10,  7, 4,  3, 5,
                5,    12,   3,   8,  1, 4, 14, 3,
                1,     1,   1,   1,  1, 1,  1, 1,
                3.4,   2,  10,   8, 10, 4,  1, 5,
                6,    10, 3.5,   7,  2, 4, 12, 3,
                1,     1,   1,   1,  1, 1,  1, 1,
                2.8, 1.8,   8,   7, 10, 3,  1, 5,
                5.7, 8.8, 2.8,   5,  2, 5,  9, 3,
                1,     1,   1,   1,  1, 1,  1, 1,
                2.2, 1.5,   8,   5,  8, 3,  1, 5,
                6,     8, 2.3, 3.5,  2, 5,  7, 3,
                1,     1,   1,   1,  1, 1,  1, 1),
              c(8, 3, 4))

# Run
  roc.malmquist(df[,1:2,], df[,3,], dm = "sbm", orientation = "n")



