library(quickblock)


### Name: assign_treatment
### Title: Random treatment assignment with blocks
### Aliases: assign_treatment

### ** Examples

# Example blocking
my_blocking <- qb_blocking(c("A", "A", "B", "C", "B",
                             "C", "C", "A", "B", "B"))

# Two treatment conditions
assign_treatment(my_blocking)

# Three treatment conditions
assign_treatment(my_blocking, c("T1", "T2", "C"))

# Four treatment conditions
# (This throws warning because some blocks contain less than four units)
## Not run: assign_treatment(my_blocking, c("T1", "T2", "T3", "C"))




