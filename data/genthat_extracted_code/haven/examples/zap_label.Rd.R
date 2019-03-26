library(haven)


### Name: zap_label
### Title: Zap label
### Aliases: zap_label

### ** Examples

x1 <- labelled(1:5, c(good = 1, bad = 5))
x1
zap_label(x1)

x2 <- labelled_spss(c(1:4, 9), c(good = 1, bad = 5), na_values = 9)
x2
zap_label(x2)

# zap_label also works with data frames
df <- tibble::data_frame(x1, x2)
df
zap_label(df)



