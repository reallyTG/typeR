library(rodham)


### Name: rodham
### Title: rodham: Hillary Rodham Clinton emails
### Aliases: rodham rodham-package
### Keywords: internal

### ** Examples

## Not run: 
##D # get emails from internal data set
##D data("emails")
##D 
##D # build graph
##D edges <- edges_emails(emails)
##D g <- igraph::graph.data.frame(edges)
##D plot(g)
##D 
##D # plot communities
##D cm <- igraph::walktrap.community(g)
##D plot(cm, g)
##D 
##D # get emails content
##D # get extractor to extract content from emails
##D ext <- get_xpdf()
##D 
##D dir.create("./emails") # create folder to store extracted content
##D 
##D # get emails released in august
##D aug_emails <- get_emails(release = "August", save.dir = "./emails",
##D                          extractor = ext)
##D 
##D # alternatively
##D # download emails as zip then extract
##D download_emails("August") # download
##D 
##D dir.create("emails_pdf") # create directory where to extract pdf emails to
##D 
##D unzip("August.zip", exdir = "./emails_pdf")
##D 
##D dir <- "emails_text"
##D 
##D dir.create(dir)
##D 
##D # extract emails to created directory
##D extract_emails("emails_pdf", save.dir = dir, ext = ext)
##D 
##D # laod all emails
##D hrc_emails <- load_emails(dir)
##D 
##D class(hrc_emails)
##D 
##D # methods
##D dates <- get_date(hrc_emails)
##D communication <- get_com(hrc_emails)
##D cont <- get_content(hrc_emails) # get actual email content
##D 
##D cont <- clean_content(cont) # clean content see help
##D 
##D # tidy content
##D cont <- tidy_emails(cont)
##D head(cont)
## End(Not run)




