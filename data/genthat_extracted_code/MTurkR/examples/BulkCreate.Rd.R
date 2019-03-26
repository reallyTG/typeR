library(MTurkR)


### Name: BulkCreate
### Title: Generate Multiple HITs
### Aliases: BulkCreate BulkCreateFromTemplate BulkCreateFromURLs
###   BulkCreateFromHITLayout
### Keywords: HITs

### ** Examples

## Not run: 
##D ## BulkCreate ##
##D 
##D # load a vector of HTML files from the working directory
##D qvec <- sapply(list.files(pattern = ".html"), function(x) {
##D           paste0(readLines(x, warn = FALSE), collapse = "\n")
##D         })
##D # create a HIT from each question file
##D hits1 <- BulkCreate(questions = qvec,
##D                     annotation = paste("Bulk Create", Sys.Date()),
##D                     title = "Categorize an image",
##D                     description = "Categorize this image",
##D                     reward = ".05",
##D                     expiration = seconds(days = 4),
##D                     duration = seconds(minutes = 5),
##D                     keywords = "categorization, image, moderation, category")
##D 
##D # cleanup
##D ExpireHIT(annotation = paste("Bulk Create", Sys.Date()))
##D DisposeHIT(annotation = paste("Bulk Create", Sys.Date()))
## End(Not run)

## Not run: 
##D ## BulkCreateFromURLs ##
##D 
##D # create three HITs from the template
##D hits2 <- 
##D BulkCreateFromURLs(url = paste0("https://www.example.com/",1:3,".html"),
##D                    frame.height = 400,
##D                    annotation = paste("Bulk From URLs", Sys.Date()),
##D                    title = "Categorize an image",
##D                    description = "Categorize this image",
##D                    reward = ".05",
##D                    expiration = seconds(days = 4),
##D                    duration = seconds(minutes = 5),
##D                    keywords = "categorization, image, moderation, category")
##D 
##D # cleanup
##D ExpireHIT(annotation = paste("Bulk From URLs", Sys.Date()))
##D DisposeHIT(annotation = paste("Bulk From URLs", Sys.Date()))
## End(Not run)

## Not run: 
##D ## BulkCreateFromTemplate ##
##D 
##D # load template HTML file
##D # should have placeholders of the form `${varName}` for variable values
##D temp <- system.file("templates/htmlquestion2.xml", package = "MTurkR")
##D 
##D # create/load data.frame of template variable values
##D a <- data.frame(hittitle = c("HIT title 1", "HIT title 2", "HIT title 3"),
##D                 hitvariable = c("HIT text 1", "HIT text 2", "HIT text 3"), 
##D                 stringsAsFactors = FALSE)
##D 
##D # create three HITs from the template
##D hits3 <- 
##D BulkCreateFromTemplate(template = temp,
##D                        input = a,
##D                        annotation = paste("Bulk From Template", Sys.Date()),
##D                        title = "Categorize an image",
##D                        description = "Categorize this image",
##D                        reward = ".05",
##D                        expiration = seconds(days = 4),
##D                        duration = seconds(minutes = 5),
##D                        keywords = "categorization, image, moderation, category")
##D 
##D # cleanup
##D ExpireHIT(annotation = paste("Bulk From Template", Sys.Date()))
##D DisposeHIT(annotation = paste("Bulk From Template", Sys.Date()))
## End(Not run)

## Not run: 
##D ## BulkCreateFromHITLayout ##
##D 
##D # retrieve HITLayoutID from Requester User Interface
##D layoutid <- "23ZGOOGQSCM61T1H5H9U0U00OQWFFU"
##D 
##D # create/load data.frame of HITLayout variable values
##D b <- data.frame(hittitle = c("HIT title 1", "HIT title 2", "HIT title 3"),
##D                 hitvariable = c("HIT text 1", "HIT text 2", "HIT text 3"), 
##D                 stringsAsFactors = FALSE)
##D 
##D # create three HITs from the template
##D hits4 <- 
##D BulkCreateFromHITLayout(hitlayoutid = layoutid,
##D                         input = b,
##D                         annotation = paste("Bulk From Layout", Sys.Date()),
##D                         title = "Categorize an image",
##D                         description = "Categorize this image",
##D                         reward = ".05",
##D                         expiration = seconds(days = 4),
##D                         duration = seconds(minutes = 5),
##D                         keywords = "categorization, image, moderation, category")
##D 
##D # cleanup
##D ExpireHIT(annotation = paste("Bulk From Layout", Sys.Date()))
##D DisposeHIT(annotation = paste("Bulk From Layout", Sys.Date()))
## End(Not run)



