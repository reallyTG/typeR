library(DJL)


### Name: dm.sbm
### Title: Distance measure using SBM
### Aliases: dm.sbm

### ** Examples

# Reproduce Table 2 in Tone.(2001)
  # ready
  X <- data.frame(x1 = c(4, 6, 8, 8, 2),
                  x2 = c(3, 3, 1, 1, 4))
  Y <- data.frame(y1 = c(2, 2, 6, 6, 1),
                  y2 = c(3, 3, 2, 1, 4))
  # go
  dm.sbm(X, Y)

# Reproduce Table 1 in Tone.(2002)
  # Published input slacks are alternate optima (confirmed by Tone)
  # ready
  X <- data.frame(x1 = c(4, 7, 8, 4, 2, 10, 12),
                  x2 = c(3, 3, 1, 2, 4, 1,  1))
  Y <- data.frame(y1 = c(1, 1, 1, 1, 1, 1,  1))
  # go
  dm.sbm(X, Y, se = TRUE)

# Reproduce Table 4 in Tone.(2002)
  # ready
  X <- data.frame(x1 = c(80,  65,  83,  40,   52,  94),
                  x2 = c(600, 200, 400, 1000, 600, 700),
                  x3 = c(54,  97,  72,  75,   20,  36),
                  x4 = c(8,   1,   4,   7,    3,   5))
  Y <- data.frame(y1 = c(90,  58,  60,  80,   72,  96),
                  y2 = c(5,   1,   7,   10,   8,   6))
  # go
  dm.sbm(X, Y, "crs", "i", se = TRUE)



