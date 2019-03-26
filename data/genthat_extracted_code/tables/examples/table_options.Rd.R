library(tables)


### Name: table_options
### Title: Set or query options for the table formatting.
### Aliases: table_options booktabs htmloptions

### ** Examples

tab <- tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
latex(tab)
save <- booktabs()
latex(tab)
table_options(save)

## No test: 
f <- tempfile(fileext = ".html")
browseURL( html(tab, f, 
  options=htmloptions(HTMLcaption="Table of Iris Data",
                      pad = TRUE))$file )
## End(No test)



