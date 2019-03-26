library(svSocket)


### Name: parSocket
### Title: Get or set parameters specific to Sciviews socket clients
### Aliases: parSocket
### Keywords: IO

### ** Examples

## We use a fake socket client configuration environment
e <- parSocket("fake")
## Look at what it contains
ls(e)
## Get one data
e$bare
## ... or
parSocket("fake")$bare

## Change it
parSocket("fake", bare = FALSE)$bare
## Note it is changed too for e
e$bare

## You can change it too with
e$bare <- TRUE
e$bare
parSocket("fake")$bare

## Create a new entry
e$foo <- "test"
ls(e)
parSocket("fake")$foo
## Now delete it
parSocket("fake", foo = NULL)
ls(e)

## Our fake socket config is in SciViews:TempEnv environment
s <- search()
l <- length(s)
pos <- (1:l)[s == "SciViews:TempEnv"]
ls(pos = pos)  # It is named 'SocketClient_fake'
## Delete it
rm(SocketClient_fake, pos = pos)
## Do some house keeping
rm(list = c("s", "l", "pos"))



