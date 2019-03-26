library(huxtable)


### Name: add_rows
### Title: Insert one matrix into another.
### Aliases: add_rows add_columns

### ** Examples

ht <- hux(
        Jam = c("Raspberry", "Plum"),
        Price = c(1.90, 1.80),
        add_colnames = TRUE
      )

ht2 <- hux("Gooseberry", 2.10)
add_rows(ht, ht2)
add_rows(ht, ht2, after = 1)

mx <- matrix(
      c("Sugar", "50%", "60%",
      "Weight (g)", 300, 250),
      3, 2)
add_columns(ht, mx, after = "Jam")



