library(roperators)


### Name: f.as.numeric
### Title: Convert factor with numeric labels into numeric vector
### Aliases: f.as.numeric

### ** Examples


 x <- factor(c(11, 22, 33, 99))
 as.numeric(x)
 # 1 2 3 4   # NOT typically the desired.expected output

 f.as.numeric(x)
 # 11 22 33 99  # Typically desired output

 # Or...
 as.numeric(as.character(x)) # A tad unsightly





