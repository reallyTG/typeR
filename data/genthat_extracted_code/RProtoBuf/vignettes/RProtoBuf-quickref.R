## ----init, echo=FALSE-------------------------
library("RProtoBuf")
options("width"=48)

## ----readab, echo=FALSE, comment=""-----------
ab.proto <- system.file("proto", "addressbook.proto", package = "RProtoBuf")
writeLines(readLines(ab.proto))

## ----readproto, eval=FALSE--------------------
#  readProtoFiles("somefile.proto")
#  readProtoFiles(dir = somedir)
#  readProtoFiles(package = AnRPackage)

## ----createmsg--------------------------------
message <- new(tutorial.Person, id = 0,
               name = "Romain Francois",
               email = "francoisromain@free.fr")

## ----serialize--------------------------------
# to a file
tf1 <- tempfile()
message$serialize(tf1)

# to a binary connection
tf2 <- tempfile()
con <- file(tf2, open = "wb")
message$serialize(con)
close(con)

# retrieve the payload
message$serialize(NULL)

## ----readbin, eval=FALSE----------------------
#  # from a file
#  tutorial.Person$read(tf1)
#  # from a connection
#  con <- file(tf2, open = "rb")
#  tutorial.Person$read(con)
#  close(con)

## ----getset-----------------------------------
email <- message$email
message$id <- 2
message[["name"]] <- "Romain"
id <- message[[2]] # tag number for 'id'

