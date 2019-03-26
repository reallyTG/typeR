library(RCurl)


### Name: chunkToLineReader
### Title: Utility that collects data from the HTTP reply into lines and
###   calls user-provided function.
### Aliases: chunkToLineReader
### Keywords: IO

### ** Examples

# Read a rectangular table of data into R from the URL
# and add up the values and the number of values read.

summer =
function()
{
  total = 0.0
  numValues = 0

  list(read = function(txt) {
                 con = textConnection(txt)
                 on.exit(close(con))
                 els = scan(con)
                 numValues <<- numValues + length(els)
                 total <<- total + sum(els)

                 ""
              },
       result = function() c(total = total, numValues = numValues))
}

s = summer()

if(url.exists("http://www.omegahat.net/RCurl/matrix.data"))
   getURL("http://www.omegahat.net/RCurl/matrix.data", write = chunkToLineReader(s$read)$read)



