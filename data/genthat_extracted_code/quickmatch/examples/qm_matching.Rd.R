library(quickmatch)


### Name: qm_matching
### Title: Constructor for qm_matching objects
### Aliases: qm_matching

### ** Examples

# 10 units in 3 matched groups
matches1 <- qm_matching(c("A", "A", "B", "C", "B",
                          "C", "C", "A", "B", "B"))

# 8 units in 3 matched groups, 2 units unassigned
matches2 <- qm_matching(c(1, 1, 2, 3, 2,
                          NA, 3, 1, NA, 2))

# Custom labels indicating unassiged units
matches3 <- qm_matching(c("A", "A", "B", "C", "NONE",
                          "C", "C", "NONE", "B", "B"),
                        unassigned_labels = "NONE")

# Two different labels indicating unassiged units
matches4 <- qm_matching(c("A", "A", "B", "C", "NONE",
                          "C", "C", "0", "B", "B"),
                        unassigned_labels = c("NONE", "0"))

# Custom unit IDs
matches5 <- qm_matching(c("A", "A", "B", "C", "B",
                          "C", "C", "A", "B", "B"),
                        ids = letters[1:10])




