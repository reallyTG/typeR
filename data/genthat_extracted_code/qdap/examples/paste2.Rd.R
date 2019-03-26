library(qdap)


### Name: paste2
### Title: Paste an Unspecified Number Of Text Columns
### Aliases: paste2 colpaste2df
### Keywords: paste

### ** Examples

## Not run: 
##D ## paste2 examples
##D v <- rep(list(state.abb[1:8],  month.abb[1:8]) , 5)
##D n <- sample(5:10, 1)
##D paste(v[1:n]) #odd looking return
##D paste2(v[1:n]) 
##D paste2(v[1:n], sep="|") 
##D paste2(mtcars[1:10,], sep="|") 
##D paste(mtcars[1:10,], sep="|") #odd looking return
##D paste2(CO2[1:10,], sep="|-|") 
##D 
##D ## colpaste2df examples
##D A <- list(
##D     a = c(1, 2, 3),
##D     b = qcv(mpg, hp),
##D     c = c("disp", "am")
##D )
##D B <- list(
##D     c(1, 2, 3),
##D     new.col = qcv(mpg, hp),
##D     c("disp", "am")
##D )
##D E <- list(
##D     c(1, 2, 3, 4, 5),
##D     qcv(mpg, hp),
##D     c("disp", "am")
##D )
##D 
##D colpaste2df(head(mtcars), A)
##D colpaste2df(head(mtcars), B)
##D colpaste2df(head(mtcars), E)
##D colpaste2df(head(mtcars), qcv(am, disp, drat), sep ="_", name.sep = "|")
##D colpaste2df(head(CO2), list(c(1, 2, 3, 4, 5), qcv("conc", "uptake")))
## End(Not run)



