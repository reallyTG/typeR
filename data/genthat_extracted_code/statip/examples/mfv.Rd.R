library(statip)


### Name: mfv
### Title: Most frequent value(s)
### Aliases: mfv mfv1

### ** Examples

# Basic examples:
mfv(c(3, 3, 3, 2, 4))            # 3
mfv(c(TRUE, FALSE, TRUE))        # TRUE
mfv(c("a", "a", "b", "a", "d"))  # "a"

mfv(c("a", "a", "b", "b", "d"))  # c("a", "b")
mfv1(c("a", "a", "b", "b", "d")) # "a"

# With missing values: 
mfv(c(3, 3, 3, 2, NA))           # 3
mfv(c(3, 3, 2, NA))              # NA
mfv(c(3, 3, 2, NA), na.rm = TRUE)# 3

# With only missing values: 
mfv(c(NA, NA))                   # NA
mfv(c(NA, NA), na.rm = TRUE)     # NaN




