library(phyclust)


### Name: nid.aid.cid
### Title: Transfer nids (0, 1, ..., 4) , aids (0, 1, ..., 21) and cids (0,
###   1, ..., 64)
### Aliases: nid2aid nid2cid cid2aid aid2acode acode2aid
### Keywords: programming

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D ### Test S3 methods by a vector
##D a.vector <- c("A", "C", "G", "-", "T", "A")
##D code2nid(a.vector)
##D nid2cid(code2nid(a.vector))
##D cid2aid(nid2cid(code2nid(a.vector)))
##D nid2aid(code2nid(a.vector))
##D aid2acode(nid2aid(code2nid(a.vector)))
##D acode2aid(aid2acode(nid2aid(code2nid(a.vector))))
##D 
##D ### Test S3 methods by a matrix
##D a.matrix <- rbind(a.vector, a.vector, a.vector)
##D code2nid(a.matrix)
##D nid2cid(code2nid(a.matrix))
##D cid2aid(nid2cid(code2nid(a.matrix)))
##D nid2aid(code2nid(a.matrix))
##D aid2acode(nid2aid(code2nid(a.matrix)))
##D acode2aid(aid2acode(nid2aid(code2nid(a.matrix))))
##D 
##D ### Test S3 methods by a list
##D a.list <- list(a.vector, a.vector)
##D code2nid(a.list)
##D nid2cid(code2nid(a.list))
##D cid2aid(nid2cid(code2nid(a.list)))
##D nid2aid(code2nid(a.list))
##D aid2acode(nid2aid(code2nid(a.list)))
##D acode2aid(aid2acode(nid2aid(code2nid(a.list))))
## End(Not run)



