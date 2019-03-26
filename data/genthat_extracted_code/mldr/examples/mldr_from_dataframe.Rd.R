library(mldr)


### Name: mldr_from_dataframe
### Title: Generates an mldr object from a data.frame and a vector with
###   label indices
### Aliases: mldr_from_dataframe

### ** Examples


library(mldr)

df <- data.frame(matrix(rnorm(1000), ncol = 10))
df$Label1 <- c(sample(c(0,1), 100, replace = TRUE))
df$Label2 <- c(sample(c(0,1), 100, replace = TRUE))
mymldr <- mldr_from_dataframe(df, labelIndices = c(11, 12), name = "testMLDR")

summary(mymldr)




