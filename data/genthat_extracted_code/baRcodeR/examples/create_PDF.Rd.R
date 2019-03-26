library(baRcodeR)


### Name: create_PDF
### Title: Make barcodes and print labels
### Aliases: create_PDF

### ** Examples

## data frame
example_vector <- as.data.frame(c("ao1", "a02", "a03"))

## Not run: 
##D ## run with default options
##D ## pdf file will be "example.pdf" saved into a temp directory
##D 
##D create_PDF(Labels = example_vector, name = file.path(tempdir(), "example"))
##D 
##D ## view example output from temp folder
##D system(paste0('open "', file.path(tempdir(), "example"), ".pdf"))
## End(Not run)

## run interactively. Overrides default pdf options
if(interactive()){
    create_PDF(user = TRUE, Labels = example_vector)
}

## No test: 
## run using a data frame, automatically choosing the "label" column
example_df <- data.frame("level1" = c("a1", "a2"), "label" = c("a1-b1",
"a1-b2"), "level2" = c("b1", "b1"))
create_PDF(user = FALSE, Labels = example_df, name = file.path(tempdir(), "example_2"))
## End(No test)

## No test: 
## run using an unnamed data frame
example_df <- data.frame(c("a1", "a2"), c("a1-b1", "a1-b2"), c("b1", "b1"))
## specify column from data frame
create_PDF(user = FALSE, Labels = example_df[,2], name = file.path(tempdir(), "example_3"))
## End(No test)
## No test: 
## create linear (code128) label rather than matrix label
example_df <- data.frame(c("a1", "a2"), c("a1-b1", "a1-b2"), c("b1", "b1"))
## specify column from data frame
create_PDF(user = FALSE, Labels = example_df, name = file.path(tempdir(),
"example_4", type = "linear"))
## End(No test)



