library(autoshiny)


### Name: make
### Title: Create a Shiny app (object or files) from an R function
### Aliases: make makeApp makeFiles

### ** Examples

## Not run: 
##D ### Example 1: Trivial anonymous function
##D makeApp(function(x=1:3, y=5:9) x+y)
##D 
##D ### Example 2: Nicer function and argument names
##D `Histogram for normal distribution` <-
##D     function(`Number of observations` =
##D              # as.integer => the argument interpreted as categorical:
##D              as.integer(c(100,10,1000)))
##D         # Generic R plots as "return values" are supported:
##D         plot(hist(rnorm(`Number of observations`)))
##D makeApp(`Histogram for normal distribution`)
##D 
##D ### Example 3: Data frame in (upload CSV), data frame out (displayed and downloadable as CSV)
##D `Table of sin and cos values` <-
##D     function(`Upload CSV file with column "x"` =
##D                  data.frame(x = seq(0, 2*pi, .25))) {
##D         dta <- `Upload CSV file with column "x"`
##D         data.frame(X = dta$x,
##D                    `Sin of X` = sin(dta$x),
##D                    `Cos of X` = cos(dta$x),
##D                    check.names = FALSE)
##D     }
##D makeApp(`Table of sin and cos values`)
##D 
##D ### Example 4: Arbitrary input and output files
##D openxlsx::write.xlsx(data.frame(x=1:5,
##D                                 y=11:15),
##D                      'my_test_file.xlsx')
##D `Excel file in and out` <-
##D     function(`Input Excel file` =
##D                  File('my_test_file.xlsx')) { # File() obligatory here!
##D         my.data <- openxlsx::read.xlsx(`Input Excel file`)
##D         my.data2 <- within(my.data,
##D                            z <- x + y)
##D         openxlsx::write.xlsx(my.data2,
##D                              'my_test_file_2.xlsx')
##D         File('my_test_file_2.xlsx') # File() obligatory here too!
##D     }
##D makeApp(`Excel file in and out`)
##D 
##D ### Example 5: Using a button as a (re-)evaluation trigger
##D ### Use this option if:
##D ### - the evaluation of your functon takes time, so it should not be re-evaluated with every
##D ###   minor change of the value of inputs/arguments/parameter;
##D ### - the function is impure e.g. depends on some external data fetched internally and takes no
##D ###   arguments/parameters -- in such a case the function would be re-evaluated only through
##D ###   page refresh of the browser; the button is a faster and a more elegant solution.
##D `Get "GDP and main components" from Eurostat` <-
##D     function() {
##D         # Getting data from
##D         # http://ec.europa.eu/eurostat/estat-navtree-portlet-prod/BulkDownloadListing ...
##D         # ... ?sort=1&file=data%2Fnama_10_gdp.tsv.gz
##D         x <- eurodata::importData('nama_10_gdp')
##D         head(x, 10)
##D     }
##D makeApp(`Get "GDP and main components" from Eurostat`,
##D         withGoButton = TRUE)
##D 
##D ### Example 6: Lists of inputs (arguments) and the output list (composite return value)
##D ### are always decomposed
##D `A function with lists everywhere` <-
##D     function(`First argument group,` = list(`number one` = 1:3,
##D                                             `number two` = letters[1:3]),
##D              `2nd arg group,` = list(`1st argument` = 11:14,
##D                                      `second arg.` = LETTERS[1:5]))
##D         list(`Some text` =
##D                  as.character(c(`First argument group,`$`number two`,
##D                                 `2nd arg group,`$`second arg.`)),
##D              `Some numbers` =
##D                  `First argument group,`$`number one` +
##D                  `2nd arg group,`$`1st argument`,
##D              `Even a ggplot2 chart` =
##D                  ggplot2::qplot(a,b,data=data.frame(a=1:20,b=log(1:20))))
##D makeApp(`A function with lists everywhere`)
## End(Not run)



