library(tables)


### Name: write.csv.tabular
### Title: Write table to file in CSV or other format.
### Aliases: write.csv.tabular write.table.tabular

### ** Examples

## Not run: 
##D # This writes a table to the clipboard on Windows using tab delimiters, for
##D # easy import into a spreadsheet.
##D 
##D write.table.tabular( 
##D     tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
##D          (Sepal.Length + Sepal.Width)*(mean + sd), data=iris ),
##D     "clipboard", sep="\t")
## End(Not run)    



