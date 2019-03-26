library(gistr)


### Name: gist_create
### Title: Create a gist
### Aliases: gist_create

### ** Examples

## Not run: 
##D file <- tempfile()
##D cat("hello world", file = file)
##D gist_create(files=file, description='a new cool gist')
##D 
##D file1 <- tempfile()
##D file2 <- tempfile()
##D cat("foo bar", file = file1)
##D cat("foo bar", file = file2)
##D gist_create(files=c(file1, file2), description='spocc demo files')
##D 
##D # include any code by passing to the code parameter
##D gist_create(code={'
##D x <- letters
##D numbers <- runif(10)
##D numbers
##D '})
##D 
##D # Knit an .Rmd file before posting as a gist
##D file <- system.file("examples", "stuff.Rmd", package = "gistr")
##D gist_create(file, description='a new cool gist', knit=TRUE)
##D 
##D file <- system.file("examples", "plots.Rmd", package = "gistr")
##D gist_create(file, description='some plots', knit=TRUE)
##D 
##D # an .Rnw file
##D file <- system.file("examples", "rnw_example.Rnw", package = "gistr")
##D gist_create(file)
##D gist_create(file, knit=TRUE)
##D 
##D # Knit code input before posting as a gist
##D gist_create(code={'
##D ```{r}
##D x <- letters
##D (numbers <- runif(8))
##D ```
##D '}, knit=TRUE)
##D 
##D library('httr')
##D url <- "https://github.com/ropensci/geojsonio/blob/master/inst/examples/zillow_or.geojson"
##D res <- httr::GET(url)
##D json <- httr::content(res, as = "text")
##D gist_create(code = json, filename = "zillow_or.geojson")
##D 
##D # Knit and include source file, so both files are in the gist
##D file <- system.file("examples", "stuff.Rmd", package = "gistr")
##D gist_create(file, knit=TRUE, include_source=TRUE)
##D 
##D gist_create(code={'
##D ```{r}
##D x <- letters
##D (numbers <- runif(8))
##D ```
##D '}, filename="code.Rmd", knit=TRUE, include_source=TRUE)
##D 
##D # Uploading images created during knit process
##D ## using imgur - if you're file uses imgur or similar, you're good
##D file <- system.file("examples", "plots_imgur.Rmd", package = "gistr")
##D cat(readLines(file), sep = "\n") # peek at file
##D gist_create(file, knit=TRUE)
##D ## if not, GitHub doesn't allow upload of binary files via the HTTP API 
##D ## (which gistr uses) - so see gist_create_git(), which uses git
##D file <- system.file("examples", "plots.Rmd", package = "gistr")
##D gist_create(file, knit=TRUE, imgur_inject = TRUE)
##D ## works with ggplot2 as well
##D file <- system.file("examples", "ggplot_imgur.Rmd", package = "gistr")
##D gist_create(file, knit=TRUE)
##D 
##D # Render `.R` files
##D file <- system.file("examples", "example1.R", package = "gistr")
##D cat(readLines(file), sep = "\n") # peek at file
##D gist_create(file, knit = TRUE)
##D gist_create(file, knit = TRUE, include_source = TRUE)
##D ## many files
##D (file1 <- system.file("examples", "example1.R", package = "gistr"))
##D (file2 <- system.file("examples", "example2.R", package = "gistr"))
##D cat(readLines(file1), sep = "\n") # peek at file
##D cat(readLines(file2), sep = "\n") # peek at file
##D gist_create(files=list(file1, file2), knit = TRUE)
##D ### three at once, some .R and some .Rmd
##D file3 <- system.file("examples", "plots_imgur.Rmd", package = "gistr")
##D gist_create(files=list(file1, file2, file3), knit = TRUE)
##D gist_create(files=list(file1, file2, file3), knit = TRUE, 
##D   include_source = TRUE)
##D 
##D # Use rmarkdown::render instead of knitr::knit
##D file <- system.file("examples", "rmarkdown_eg.Rmd", package = "gistr")
##D gist_create(file, knit = TRUE, rmarkdown = TRUE, imgur_inject = TRUE,
##D    renderopts = list(output_format = "md_document"))
## End(Not run)



