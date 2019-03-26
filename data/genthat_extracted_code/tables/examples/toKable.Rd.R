library(tables)


### Name: toKable
### Title: Convert 'tabular' object to 'knitr_kable' format.
### Aliases: toKable getKnitrFormat

### ** Examples

if (requireNamespace("kableExtra")) {
  tab <-  tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
          (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
  print(kableExtra::kable_styling(toKable(tab), latex_options = "striped"))
  cat("\n")
  toKable(tab, format = "html", options = list(HTMLcaption = "Fisher's iris data"))
}



