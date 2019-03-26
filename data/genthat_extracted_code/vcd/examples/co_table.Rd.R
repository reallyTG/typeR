library(vcd)


### Name: co_table
### Title: Compute Conditional Tables
### Aliases: co_table
### Keywords: array

### ** Examples

data("HairEyeColor")
co_table(HairEyeColor, 1)
co_table(HairEyeColor, c("Hair", "Eye"))
co_table(HairEyeColor, 1:2, collapse = "")



