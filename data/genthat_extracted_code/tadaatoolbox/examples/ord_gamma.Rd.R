library(tadaatoolbox)


### Name: ord_gamma
### Title: Gamma
### Aliases: ord_gamma

### ** Examples

df <- data.frame(rating = round(runif(50, 1, 5)),
                 group  = sample(c("A", "B", "C"), 50, TRUE))
tbl <- table(df)
ord_gamma(tbl)



