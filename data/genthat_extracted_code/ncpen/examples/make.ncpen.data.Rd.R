library(ncpen)


### Name: make.ncpen.data
### Title: Create ncpen Data Structure Using a Formula
### Aliases: make.ncpen.data

### ** Examples

data = data.frame(y = 1:5, x1 = 6:10, x2 = 11:15);
formula = log(y) ~ log(x1) + x2;
make.ncpen.data(formula, data);




