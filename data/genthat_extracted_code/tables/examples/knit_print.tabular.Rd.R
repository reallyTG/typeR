library(tables)


### Name: knit_print.tabular
### Title: Custom printing of 'tabular' objects.
### Aliases: knit_print.tabular

### ** Examples

tab <- tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
knitr::knit_print(tab)



