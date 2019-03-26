library(quickblock)


### Name: qb_blocking
### Title: Constructor for qb_blocking objects
### Aliases: qb_blocking

### ** Examples

# 10 units in 3 blocks
blocking1 <- qb_blocking(c("A", "A", "B", "C", "B",
                           "C", "C", "A", "B", "B"))

# 8 units in 3 blocks, 2 units unassigned
blocking2 <- qb_blocking(c(1, 1, 2, 3, 2,
                           NA, 3, 1, NA, 2))

# Custom labels indicating unassigned units
blocking3 <- qb_blocking(c("A", "A", "B", "C", "NONE",
                           "C", "C", "NONE", "B", "B"),
                        unassigned_labels = "NONE")

# Two different labels indicating unassigned units
blocking4 <- qb_blocking(c("A", "A", "B", "C", "NONE",
                           "C", "C", "0", "B", "B"),
                        unassigned_labels = c("NONE", "0"))

# Custom unit IDs
blocking5 <- qb_blocking(c("A", "A", "B", "C", "B",
                           "C", "C", "A", "B", "B"),
                        ids = letters[1:10])




