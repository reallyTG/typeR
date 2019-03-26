library(tables)


### Name: latex.tabular
### Title: Display a tabular object using LaTeX.
### Aliases: latex.tabular

### ** Examples

tab <- tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
latex(tab)
save <- booktabs()
latex(tab)
table_options(save)



