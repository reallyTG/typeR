library(huxtable)


### Name: insert_column
### Title: Insert a row or column
### Aliases: insert_column insert_row

### ** Examples

ht <- hux(a = 1:5, b = 1:5, c = 1:5)
insert_row(ht, 2.5, 2.5, 2.5,
      after = 2)

insert_column(ht, 5:1)
insert_column(ht, 5:1, after = 3)
insert_column(ht, 5:1, after = "b")



