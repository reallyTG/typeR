library(sofa)


### Name: attachments
### Title: Work with attachments
### Aliases: attachments doc_attach_create doc_attach_info doc_attach_get
###   doc_attach_delete

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D if ("drinksdb" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="drinksdb"))
##D }
##D db_create(x, dbname='drinksdb')
##D 
##D # create an attachment on an existing document
##D ## create a document first
##D doc <- '{"name":"stuff", "drink":"soda"}'
##D doc_create(x, dbname="drinksdb", doc=doc, docid="asoda")
##D 
##D ## create a csv attachment
##D row.names(mtcars) <- NULL
##D file <- tempfile(fileext = ".csv")
##D write.csv(mtcars, file = file, row.names = FALSE)
##D doc_attach_create(x, dbname="drinksdb", docid="asoda",
##D   attachment=file, attname="mtcarstable.csv")
##D 
##D ## create a binary (png) attachment
##D file <- tempfile(fileext = ".png")
##D png(file)
##D plot(1:10)
##D dev.off()
##D doc_attach_create(x, dbname="drinksdb", docid="asoda",
##D   attachment=file, attname="img.png")
##D 
##D ## create a binary (pdf) attachment
##D file <- tempfile(fileext = ".pdf")
##D pdf(file)
##D plot(1:10)
##D dev.off()
##D doc_attach_create(x, dbname="drinksdb", docid="asoda",
##D   attachment=file, attname="plot.pdf")
##D 
##D # get info for an attachment (HEAD request)
##D doc_attach_info(x, "drinksdb", docid="asoda", attname="mtcarstable.csv")
##D doc_attach_info(x, "drinksdb", docid="asoda", attname="img.png")
##D doc_attach_info(x, "drinksdb", docid="asoda", attname="plot.pdf")
##D 
##D # get an attachment (GET request)
##D res <- doc_attach_get(x, "drinksdb", docid="asoda",
##D   attname="mtcarstable.csv", as = "text")
##D read.csv(text = res)
##D doc_attach_get(x, "drinksdb", docid="asoda", attname="img.png")
##D doc_attach_get(x, "drinksdb", docid="asoda", attname="plot.pdf")
##D 
##D # delete an attachment
##D doc_attach_delete(x, "drinksdb", docid="asoda", attname="mtcarstable.csv")
##D doc_attach_delete(x, "drinksdb", docid="asoda", attname="img.png")
##D doc_attach_delete(x, "drinksdb", docid="asoda", attname="plot.pdf")
## End(Not run)



