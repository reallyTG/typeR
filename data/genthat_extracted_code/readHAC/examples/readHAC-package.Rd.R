library(readHAC)


### Name: readHAC-package
### Title: Read acoustic HAC raw data
### Aliases: readHAC-package

### ** Examples

require(readHAC)

######################################################################
## Example file
hacfile <- system.file("hac", "Hac-test_000001.hac", package="readHAC")

######################################################################
## Step 1. Read hac data into R
hac <- readHAC(hacfile)
print(hac)

######################################################################
## Step 2. Select sub-components
pingdata <- ( subset(hac, softwarechannel==3 & type==10000) )
channel  <- ( subset(hac, softwarechannel==3 & type==9001 ) )
echosounder <- ( subset(hac, echosounder==channel$echosounder & type==901) )

######################################################################
## Step 3. Parse the binary data
print( parseHAC(pingdata) )
info <- parseHAC(channel)[5:7]
s <- ( parseHAC(pingdata)$"Sample value" )
s[s>0] <- NA  ## discard positive dB values
sec <- parseHAC(pingdata)$"Time CPU ANSI"; sec <- sec - min(sec)
flip <- function(x) t( x[nrow(x):1, ] )
image(sec, 1:nrow(s), flip(s), axes=FALSE, ylab="sample")
axis(1)
at <- seq(nrow(s), 1, by=-100)
axis(2, at=at, labels=nrow(s)-at)
box()
legend("topright", legend=paste(names(info), unlist(info)) )



