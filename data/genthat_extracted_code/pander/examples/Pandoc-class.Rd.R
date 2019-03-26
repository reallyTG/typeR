library(pander)


### Name: Pandoc-class
### Title: Reporting with Pandoc
### Aliases: Pandoc-class Pandoc

### ** Examples

## Not run: 
##D ## Initialize a new Pandoc object
##D myReport <- Pandoc$new()
##D 
##D ## Add author, title and date of document
##D myReport$author <- 'Anonymous'
##D myReport$title  <- 'Demo'
##D 
##D ## Or it could be done while initializing
##D myReport <- Pandoc$new('Anonymous', 'Demo')
##D 
##D ## Add some free text
##D myReport$add.paragraph('Hello there, this is a really short tutorial!')
##D 
##D ## Add maybe a header for later stuff
##D myReport$add.paragraph('# Showing some raw R objects below')
##D 
##D ## Adding a short matrix
##D myReport$add(matrix(5,5,5))
##D 
##D ## Or a table with even # TODO: caption
##D myReport$add.paragraph('Hello table:')
##D myReport$add(table(mtcars$am, mtcars$gear))
##D 
##D ## Or a "large" data frame which barely fits on a page
##D myReport$add(mtcars)
##D 
##D ## And a simple linear model with Anova tables
##D ml <- with(lm(mpg ~ hp + wt), data = mtcars)
##D myReport$add(ml)
##D myReport$add(anova(ml))
##D myReport$add(aov(ml))
##D 
##D ## And do some principal component analysis at last
##D myReport$add(prcomp(USArrests))
##D 
##D ## Sorry, I did not show how Pandoc deals with plots:
##D myReport$add(plot(1:10)) # TODO: caption
##D 
##D ## Want to see the report? Just print it:
##D myReport
##D 
##D ## Exporting to PDF (default)
##D myReport$export()
##D 
##D ## Or to docx in tempdir:
##D myReport$format <- 'docx'
##D myReport$export(tempfile())
##D 
##D ## You do not want to see the generated report after generation?
##D myReport$export(open = FALSE)
## End(Not run)



