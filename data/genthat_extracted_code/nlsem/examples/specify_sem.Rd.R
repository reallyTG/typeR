library(nlsem)


### Name: specify_sem
### Title: Specify a structural equation model
### Aliases: specify_sem

### ** Examples

# with default constraints
model <- specify_sem(num.x = 6, num.y = 3, num.xi = 2, num.eta = 1,
  xi = "x1-x3,x4-x6", eta = "y1-y3")

# create data frame
specs <- as.data.frame(model)
# and add custom constraints
constr <- c(1, NA, NA, 0, 0, 0, 0, 0, 0, 1, NA, NA, 1, NA, NA, NA, NA, 1, NA,
  0, 0, 0, 0, 0, 0, NA, 0, 0, 0, 0, 0, 0, NA, 0, 0, 0, 0, 0, 0, NA, 0, 0, 0,
  0, 0, 0, NA, 0, 0, 0, 0, 0, 0, NA, NA, 0, 0, 0, NA, 0, 0, 0, NA, NA, NA,
  NA, 0, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 0, 0, 0, 0, NA, 0)
specs$class1 <- constr
# create model from data frame
model.custom <- create_sem(specs)



