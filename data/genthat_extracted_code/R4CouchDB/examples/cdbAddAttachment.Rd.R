library(R4CouchDB)


### Name: cdbAddAttachment
### Title: Add attachments
### Aliases: cdbAddAttachment
### Keywords: misc

### ** Examples

## Not run: 
##D ccc            <- cdbIni(DBName="r4couch_db")
##D ccc$dataList   <- list(normalDistRand =  rnorm(20))
##D ccc            <- cdbAddDoc(ccc)
##D # make a 3d plot (stolen from ?persp)
##D x              <- seq(-10, 10, length= 30)
##D y              <- x
##D f              <- function(x,y) {r <- sqrt(x^2+y^2); 10 * sin(r)/r }
##D z              <- outer(x, y, f)
##D 
##D z[is.na(z)]    <- 1
##D op             <- par(bg = "black")
##D ccc$fileName   <- "3dplot.pdf"
##D 
##D pdf(ccc$fileName)
##D persp(x, y, z,
##D       theta = 30,
##D       phi = 30,
##D       expand = 0.5,
##D       col = "lightblue")
##D dev.off()
##D # add the plot as attachment to the database
##D # it workes over  ccc$fileName
##D ccc            <- cdbAddAttachment(ccc)
## End(Not run)



