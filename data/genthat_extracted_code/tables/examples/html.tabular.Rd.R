library(tables)


### Name: html.tabular
### Title: Display a tabular object using HTML.
### Aliases: html.tabular writeCSS

### ** Examples

## No test: 
X <- rnorm(125, sd=100)
Group <- factor(sample(letters[1:5], 125, rep=TRUE))

tab <- tabular( Group ~ (N=1)+Format(digits=2)*X*((Mean=mean) + Heading("Std Dev")*sd) )

save <- table_options()
table_options(rowlabeljustification="c")

f <- tempfile(fileext=".html")
con <- file(f, "wt")

html(tab, con, options=htmloptions(head=TRUE, table=FALSE))

writeLines("<p>This table has pad = FALSE.  The centered numbers look
sloppy.<br>", con)

html(tab, con, options=htmloptions(head=FALSE, table=TRUE, pad=FALSE))

writeLines("<p>This table has pad = FALSE and justification=\"r\".
The justification makes the columns of numbers look all right (except
for the hyphens used as minus signs), but they are placed poorly
relative to the labels.<br>", con)

html(tab, con, options=htmloptions(head=FALSE, table=TRUE, pad=FALSE, justification="r"))

writeLines("<p>This one has pad = TRUE. It looks best, but if you cut
and paste, the spacing characters may cause problems.<br>", con)

html(tab, con, options=htmloptions(head=FALSE, table=TRUE, pad=TRUE))

table_options(save)
close(con)
browseURL(f)
## End(No test)



