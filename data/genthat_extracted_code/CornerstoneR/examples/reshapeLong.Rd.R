library(CornerstoneR)


### Name: reshapeLong
### Title: Reshape Grouped Data to Long
### Aliases: reshapeLong

### ** Examples

# Data to transform:
library(data.table)
dtTest = data.table(i_1 = c(1:4, NA, 5), i_2 = c(51, 61, NA , 71, 81, 91)
                    , f1 = factor(sample(c(letters[1:3], NA), 6, TRUE))
                    , f2 = factor(c("z", "a", "x", "c", "x", "x"), ordered = TRUE)
                    )
# Reshape to long format:
reshapeLong(dtTest, c("i_1", "i_2"), c("f1", "f2"), list(split = "_"), return.results = TRUE)



