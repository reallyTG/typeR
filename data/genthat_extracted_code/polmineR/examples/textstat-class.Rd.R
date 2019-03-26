library(polmineR)


### Name: textstat-class
### Title: S4 textstat superclass.
### Aliases: textstat-class as.data.frame,textstat-method
###   show,textstat-method dim,textstat-method colnames,textstat-method
###   rownames,textstat-method names,textstat-method
###   as.DataTables,textstat-method head,textstat-method
###   tail,textstat-method nrow,textstat-method ncol,textstat-method
###   as.data.table,textstat-method round,textstat-method
###   sort,textstat-method [,textstat,ANY,ANY,ANY-method [[,textstat-method
###   name name<- name,textstat-method name,character-method
###   name<-,textstat,character-method as.bundle +,textstat,textstat-method
###   subset,textstat-method as.data.table.textstat
###   p_attributes,textstat-method knit_print,textstat-method
###   format,textstat-method view,textstat-method

### ** Examples

use("polmineR")
P <- partition("GERMAPARLMINI", date = ".*", p_attribute = "word", regex = TRUE)
y <- cooccurrences(P, query = "Arbeit")

# Standard generic methods known from data.frames work for objects inheriting
# from the textstat class

head(y)
tail(y)
nrow(y)
ncol(y)
dim(y)
colnames(y)

# Use brackets for indexing 

## Not run: 
##D y[1:25]
##D y[,c("word", "ll")]
##D y[1:25, "word"]
##D y[1:25][["word"]]
##D y[which(y[["word"]] %in% c("Arbeit", "Sozial"))]
##D y[ y[["word"]] %in% c("Arbeit", "Sozial") ]
## End(Not run)



