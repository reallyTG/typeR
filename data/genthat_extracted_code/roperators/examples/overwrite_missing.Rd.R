library(roperators)


### Name: %na<-%
### Title: Assign value to a vector's missing values
### Aliases: %na<-%

### ** Examples

 x <- c("a", NA, "c")

 x %na<-% "b"

 print(x)
 # "a" "b" "c"

 x <- c(1, NA, 3, NA)

 x %na<-% c(2,4)

 print(x)
 # 1 2 3 4




