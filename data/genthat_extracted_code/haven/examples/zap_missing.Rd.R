library(haven)


### Name: zap_missing
### Title: Zap special missings to regular R missings
### Aliases: zap_missing

### ** Examples

x1 <- labelled(
  c(1, 5, tagged_na("a", "b")),
  c(Unknown = tagged_na("a"), Refused = tagged_na("b"))
)
x1
zap_missing(x1)

x2 <- labelled_spss(
  c(1, 2, 1, 99),
  c(missing = 99),
  na_value = 99
)
x2
zap_missing(x2)

# You can also apply to data frames
df <- tibble::data_frame(x1, x2, y = 4:1)
df
zap_missing(df)



