library(tatoo)


### Name: tag_table
### Title: Tag Tables
### Aliases: tag_table Tagged_table tagged_table

### ** Examples


dat <- data.frame(
  name  = c("hans", "franz", "dolores"),
  grade = c(1, 3, 2)
)

table_metadata <- tt_meta(
  table_id = "Tab1",
  title = "Grades",
  longtitle = "grades of the final examination"
)

# Metadata can be assign in a formal way or via set functions
dat <- tag_table(dat,  meta = table_metadata)
meta(dat) <- table_metadata

# Table metadata is stored as an attribute, and cann be acces thus. It can
# also be modified via convenient set functions
attr(dat, 'meta')$title
meta(dat)$title
longtitle(dat) <- "Grades of the final examination"

# [1] "Grades"

print(dat)

# Tab1: Grades - Grades of the final examination
#
# name grade
# 1:    hans     1
# 2:   franz     3
# 3: dolores     2




