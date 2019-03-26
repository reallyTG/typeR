library(statnet.common)


### Name: wmatrix
### Title: A data matrix with row weights
### Aliases: wmatrix logwmatrix linwmatrix is.wmatrix is.logwmatrix
###   is.linwmatrix as.linwmatrix as.logwmatrix as.linwmatrix.linwmatrix
###   as.linwmatrix.logwmatrix as.logwmatrix.logwmatrix
###   as.logwmatrix.linwmatrix as.linwmatrix.matrix as.logwmatrix.matrix
###   print.wmatrix print.logwmatrix print.linwmatrix
###   compress_rows.logwmatrix compress_rows.linwmatrix
###   decompress_rows.wmatrix [.wmatrix [<-.wmatrix

### ** Examples

(m <- matrix(1:3, 2, 3, byrow=TRUE))
(m <- rbind(m, 3*m, 2*m, m))
(mlog <- as.logwmatrix(m))
(mlin <- as.linwmatrix(m))
(cmlog <- compress_rows(mlog))
(cmlin <- compress_rows(mlin))

stopifnot(all.equal(as.linwmatrix(cmlog),cmlin))

cmlog[2,] <- 1:3
(cmlog <- compress_rows(cmlog))
stopifnot(sum(rowweights(cmlog))==nrow(m))

(m3 <- matrix(c(1:3,(1:3)*2,(1:3)*3), 3, 3, byrow=TRUE))
(rowweights(m3) <- c(4, 2, 2))

stopifnot(all.equal(compress_rows(as.logwmatrix(m)), as.logwmatrix(m3),check.attributes=FALSE))
stopifnot(all.equal(rowweights(compress_rows(as.logwmatrix(m))),
                    rowweights(as.logwmatrix(m3)),check.attributes=FALSE))



