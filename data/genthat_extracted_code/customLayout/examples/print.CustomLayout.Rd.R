library(customLayout)


### Name: print.CustomLayout
### Title: Print a CustomLayout object.
### Aliases: print.CustomLayout

### ** Examples


lay  <- lay_new(matrix(1:4,nc=2),widths=c(3,2),heights=c(2,1))
lay2 <- lay_new(matrix(1:3))
cl <- lay_bind_col(lay,lay2, widths=c(3,1))
print(cl)

cl2 <- lay_bind_col(cl,cl, c(2,1))
print(cl2)

cl3 <- lay_bind_row(cl,cl, c(20,1))
print(cl3) 




