library(seqinr)


### Name: parser.socket
### Title: Utility function to parse answers from an ACNUC server
### Aliases: parser.socket
### Keywords: utilities

### ** Examples

stopifnot(all(parser.socket("code=0&lrank=2&count=150513&type=SQ&locus=F") 
                                     == c("0", "2", "150513", "SQ", "F")))



