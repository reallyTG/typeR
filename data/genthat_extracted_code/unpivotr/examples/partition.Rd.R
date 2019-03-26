library(unpivotr)


### Name: partition
### Title: Divide a grid of cells into partitions containing individual
###   tables
### Aliases: partition partition_dim

### ** Examples

# The `purpose` dataset, represented in four summary tables
multiples <- purpose$small_multiples
rectify(multiples, character, numeric)

# The same thing in its raw 'melted' form that can be filtered
multiples

# First, find the cells that mark a corner of each table
corners <-
  dplyr::filter(multiples,
                !is.na(character),
                !(character %in% c("Sex", "Value", "Female", "Male")))

# Then find out which cells fall into which partition
partition(multiples, corners)

# You can also use bottom-left corners (or top-right or bottom-right)
bl_corners <- dplyr::filter(multiples, character == "Male")
partition(multiples, bl_corners, align = "bottom_left")

# To complete the grid even when not all corners are supplied, use `strict`
bl_corners <- bl_corners[-1, ]
partition(multiples, bl_corners, align = "bottom_left")
partition(multiples, bl_corners, align = "bottom_left", strict = FALSE)
# Given a set of cells in rows 1 to 10, partition them at the 3rd, 5th and 7th
# rows.
partition_dim(1:10, c(3, 5, 7))

# Given a set of cells in columns 1 to 10, partition them at the 3rd, 5th and
# 7th column.  This example is exactly the same as the previous one, to show
# that the function works the same way on columns as rows.
partition_dim(1:10, c(3, 5, 7))

# Given a set of cells in rows 1 to 10, partition them at the 3rd, 5th and
# 7th rows, aligned to the bottom of the group.
partition_dim(1:10, c(3, 5, 7), bound = "lower")

# Non-integer row/column numbers and cutpoints can be used, even though they
# make no sense in the context of partioning grids of cells.  They are
# rounded towards zero first.
partition_dim(1:10 - .5, c(3, 5, 7))
partition_dim(1:10, c(3, 5, 7) + 1.5)



