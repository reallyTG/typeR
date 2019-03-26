library(PivotalR)


### Name: merge-method
### Title: Computing a join on two tables
### Aliases: merge,db.obj,db.obj-method
### Keywords: methods data operation database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create sample databases
##D authors <- data.frame(
##D     surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
##D     nationality = c("US", "Australia", "US", "UK", "Australia"),
##D     deceased = c("yes", rep("no", 4)))
##D 
##D books <- data.frame(
##D     name = I(c("Tukey", "Venables", "Tierney",
##D              "Ripley", "Ripley", "McNeil", "R Core")),
##D     title = c("Exploratory Data Analysis",
##D               "Modern Applied Statistics ...",
##D               "LISP-STAT",
##D               "Spatial Statistics", "Stochastic Simulation",
##D               "Interactive Data Analysis",
##D               "An Introduction to R"),
##D     other.author = c(NA, "Ripley", NA, NA, NA, NA,
##D                      "Venables & Smith"))
##D 
##D delete("books", conn.id = cid)
##D delete("authors", conn.id = cid)
##D as.db.data.frame(books, 'books', conn.id = cid, verbose = FALSE)
##D as.db.data.frame(authors, 'authors', conn.id = cid, verbose = FALSE)
##D 
##D ## Cast them as db.data.frame objects
##D a <- db.data.frame('authors', conn.id = cid, verbose = FALSE)
##D b <- db.data.frame('books', conn.id = cid, verbose = FALSE)
##D 
##D ## Merge them together
##D m1 <- merge(a, b, by.x = "surname", by.y = "name", all = TRUE)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



