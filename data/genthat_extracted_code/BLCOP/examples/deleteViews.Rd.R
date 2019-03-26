library(BLCOP)


### Name: deleteViews
### Title: Delete individual views from view objects
### Aliases: deleteViews
### Keywords: manip

### ** Examples

    stocks <- colnames(monthlyReturns)
    pick <- matrix(0, ncol = 6, nrow = 2, dimnames = list(NULL, stocks))
    pick[1,"IBM"] <- 1
    pick[1, "DELL"] <- 0.04
    pick[2, "C"] <- 1
    pick[2, "JPM"] <- 0.6

    confidences <- 1 / c(0.7, 0.1)

    views <- BLViews( P = pick, q = c(0.1,0.1) , confidences = confidences,stocks)
    deleteViews(views, 1)
   



