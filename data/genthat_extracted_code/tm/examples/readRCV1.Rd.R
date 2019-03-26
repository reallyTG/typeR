library(tm)


### Name: readRCV1
### Title: Read In a Reuters Corpus Volume 1 Document
### Aliases: readRCV1 readRCV1asPlain

### ** Examples

f <- system.file("texts", "rcv1_2330.xml", package = "tm")
f_bin <- readBin(f, raw(), file.size(f))
rcv1 <- readRCV1(elem = list(content = f_bin), language = "en", id = "id1")
content(rcv1)
meta(rcv1)



