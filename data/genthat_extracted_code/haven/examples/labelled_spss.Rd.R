library(haven)


### Name: labelled_spss
### Title: Labelled vectors for SPSS
### Aliases: labelled_spss

### ** Examples

x1 <- labelled_spss(1:10, c(Good = 1, Bad = 8), na_values = c(9, 10))
is.na(x1)

x2 <- labelled_spss(1:10, c(Good = 1, Bad = 8), na_range = c(9, Inf),
                    label = "Quality rating")
is.na(x2)

# Print data and metadata
x2



