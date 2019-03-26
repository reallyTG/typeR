library(pillar)


### Name: style_num
### Title: Styling helpers
### Aliases: style_num style_subtle style_subtle_num style_bold style_na
###   style_neg

### ** Examples

style_num(
  c("123", "456"),
  negative = c(TRUE, FALSE)
)
style_num(
  c("123", "456"),
  negative = c(TRUE, FALSE),
  significant = c(FALSE, FALSE)
)
style_subtle("text")
style_subtle_num(0.01 * 1:3, c(TRUE, FALSE, TRUE))
style_bold("Petal.Width")
style_na("NA")
style_neg("123")



