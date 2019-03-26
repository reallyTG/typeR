library(StandardizeText)


### Name: StandardizeText-package
### Title: Standardize Text
### Aliases: StandardizeText-package StandardizeText
### Keywords: standardize matching text string country names

### ** Examples

library(StandardizeText)
sample.text <- c("blue car","STOP","email","tree")
sample.std <- c("the tree","car","e-mail","stop")
sample.df <- data.frame(foo=2:5,bar=sample.text, baz=7:4, qux=sample.std)
out.a <- standardize.text(sample.text,standard=sample.std,suggest="auto")
out.b <- standardize.text(sample.df,2,sample.df,"qux",suggest="auto")



