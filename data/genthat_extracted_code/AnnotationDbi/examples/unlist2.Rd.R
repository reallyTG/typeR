library(AnnotationDbi)


### Name: unlist2
### Title: A replacement for unlist() that does not mangle the names
### Aliases: unlist2
### Keywords: utilities manip

### ** Examples

  x <- list(A=c(b=-4, 2, b=7), B=3:-1, c(a=1, a=-2), C=list(c(2:-1, d=55), e=99))
  unlist(x)
  unlist2(x)

  library(hgu95av2.db)
  egids <- c("10", "100", "1000")
  egids2pbids <- mget(egids, revmap(hgu95av2ENTREZID))
  egids2pbids

  unlist(egids2pbids)   # 1001, 1002, 10001 and 10002 are not real
                        # Entrez ids but are the result of unlist()
                        # mangling the names!

  unlist2(egids2pbids)  # much cleaner! yes the names are not unique
                        # but at least they are correct...



