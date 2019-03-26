library(berryFunctions)


### Name: normalizePathCP
### Title: normalizePath Cross Platform
### Aliases: normalizePathCP
### Keywords: file

### ** Examples


normalizePath  ("doesnotexist.file", mustWork=FALSE) # on unix not full path
normalizePathCP("doesnotexist.file") # full path on all platforms

normalizePath  ("../doesnotexist.file", mustWork=FALSE)
normalizePathCP("../doesnotexist.file")
 
checknp <- function(a,b=a,d=getwd())
  {
  aa <- normalizePathCP(a)
  bb <- if(d=="") b else paste0(d,"/",b)
  if(aa != bb) stop("'", a, "' -> '", aa, "', should be '",bb, "'.")
  aa
  }

checknp("notexist.file")
checknp("../notexist.file", "notexist.file", dirname(getwd()))
checknp("notexistfolder/notexist.file")
#checknp("/home/berry/notexist.file", d="") # fails on windows
#checknp("S:/Dropbox/notexist.file",d="") # fails on linux




