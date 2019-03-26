## ----results='hide', message=FALSE---------------------------------------
library(tables)

## ------------------------------------------------------------------------
X <- rnorm(125, sd=100)
Group <- factor(sample(letters[1:5], 125, rep=TRUE))
tab <- tabular( Group ~ (N=1)+Format(digits=2)*X*((Mean=mean) + Heading("Std Dev")*sd) )

## ------------------------------------------------------------------------
table_options(htmloptions(head=FALSE))

## ------------------------------------------------------------------------
tab

## ------------------------------------------------------------------------
table_options(knit_print = FALSE)
tab        # This chunk uses the default results = 'markup'

## ----results = 'asis'----------------------------------------------------
html(tab)  # This chunk uses results = 'asis'

## ----results='asis'------------------------------------------------------
writeCSS()

## ------------------------------------------------------------------------
table_options(htmloptions(head = FALSE, justification = "r", knit_print = TRUE))
tab

## ------------------------------------------------------------------------
table_options(htmloptions(head = FALSE, justification = "c", pad = TRUE))
tab

## ----comment=NA, echo=FALSE----------------------------------------------
cat(table_options()$CSS)

## ------------------------------------------------------------------------
table_options(CSS =
"<style>
#ID .center { 
  text-align:center;
  background-color: aliceblue;
}
</style>", doCSS = TRUE)
tab
table_options(doCSS = FALSE)
tab

## ------------------------------------------------------------------------
library(magrittr)
library(kableExtra)
toKable(tab) %>% 
  kable_styling("striped", position = "float_right", full_width = FALSE) %>%
  add_header_above(c("Row Label" = 1, "Statistics" = 3)) %>%
  column_spec(4, color = "red") %>%
  row_spec(1, color = "blue") %>%
  group_rows("Subgroup", 3, 5)

