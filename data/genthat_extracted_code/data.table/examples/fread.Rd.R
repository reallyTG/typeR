library(data.table)


### Name: fread
### Title: Fast and friendly file finagler
### Aliases: fread
### Keywords: data

### ** Examples

## Not run: 
##D 
##D # Demo speed-up
##D n = 1e6
##D DT = data.table( a=sample(1:1000,n,replace=TRUE),
##D                  b=sample(1:1000,n,replace=TRUE),
##D                  c=rnorm(n),
##D                  d=sample(c("foo","bar","baz","qux","quux"),n,replace=TRUE),
##D                  e=rnorm(n),
##D                  f=sample(1:1000,n,replace=TRUE) )
##D DT[2,b:=NA_integer_]
##D DT[4,c:=NA_real_]
##D DT[3,d:=NA_character_]
##D DT[5,d:=""]
##D DT[2,e:=+Inf]
##D DT[3,e:=-Inf]
##D 
##D write.table(DT,"test.csv",sep=",",row.names=FALSE,quote=FALSE)
##D cat("File size (MB):", round(file.info("test.csv")$size/1024^2),"\n")
##D # 50 MB (1e6 rows x 6 columns)
##D 
##D system.time(DF1 <-read.csv("test.csv",stringsAsFactors=FALSE))
##D # 60 sec (first time in fresh R session)
##D 
##D system.time(DF1 <- read.csv("test.csv",stringsAsFactors=FALSE))
##D # 30 sec (immediate repeat is faster, varies)
##D 
##D system.time(DF2 <- read.table("test.csv",header=TRUE,sep=",",quote="",
##D     stringsAsFactors=FALSE,comment.char="",nrows=n,
##D     colClasses=c("integer","integer","numeric",
##D                  "character","numeric","integer")))
##D # 10 sec (consistently). All known tricks and known nrows, see references.
##D 
##D require(data.table)
##D if(all(sapply(c("sqldf", "ff"), requireNamespace, quietly = TRUE))) {
##D   require(sqldf)
##D   require(ff)
##D 
##D   system.time(DT <- fread("test.csv"))
##D   #  3 sec (faster and friendlier)
##D 
##D   system.time(SQLDF <- read.csv.sql("test.csv",dbname=NULL))
##D   # 20 sec (friendly too, good defaults)
##D 
##D   system.time(FFDF <- read.csv.ffdf(file="test.csv",nrows=n))
##D   # 20 sec (friendly too, good defaults)
##D 
##D   identical(DF1,DF2)
##D   all.equal(as.data.table(DF1), DT)
##D   identical(DF1,within(SQLDF,{b<-as.integer(b);c<-as.numeric(c)}))
##D   identical(DF1,within(as.data.frame(FFDF),d<-as.character(d)))
##D }
##D 
##D # Scaling up ...
##D l = vector("list",10)
##D for (i in 1:10) l[[i]] = DT
##D DTbig = rbindlist(l)
##D tables()
##D write.table(DTbig,"testbig.csv",sep=",",row.names=FALSE,quote=FALSE)
##D # 500MB (10 million rows x 6 columns)
##D 
##D system.time(DF <- read.table("testbig.csv",header=TRUE,sep=",",
##D     quote="",stringsAsFactors=FALSE,comment.char="",nrows=1e7,
##D     colClasses=c("integer","integer","numeric",
##D                  "character","numeric","integer")))
##D # 100-200 sec (varies)
##D 
##D system.time(DT <- fread("testbig.csv"))
##D # 30-40 sec
##D 
##D all(mapply(all.equal, DF, DT))
##D 
##D 
##D # Real data example (Airline data)
##D # http://stat-computing.org/dataexpo/2009/the-data.html
##D 
##D download.file("http://stat-computing.org/dataexpo/2009/2008.csv.bz2",
##D               destfile="2008.csv.bz2")
##D # 109MB (compressed)
##D 
##D system("bunzip2 2008.csv.bz2")
##D # 658MB (7,009,728 rows x 29 columns)
##D 
##D colClasses = sapply(read.csv("2008.csv",nrows=100),class)
##D # 4 character, 24 integer, 1 logical. Incorrect.
##D 
##D colClasses = sapply(read.csv("2008.csv",nrows=200),class)
##D # 5 character, 24 integer. Correct. Might have missed data only using 100 rows
##D # since read.table assumes colClasses is correct.
##D 
##D system.time(DF <- read.table("2008.csv", header=TRUE, sep=",",
##D     quote="",stringsAsFactors=FALSE,comment.char="",nrows=7009730,
##D     colClasses=colClasses))
##D # 360 secs
##D 
##D system.time(DT <- fread("2008.csv"))
##D #  40 secs
##D 
##D table(sapply(DT,class))
##D # 5 character and 24 integer columns. Correct without needing to worry about colClasses
##D # issue above.
##D 
##D 
##D # Reads URLs directly :
##D fread("http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat")
##D 
##D # Decompresses .gz and .bz2 automatically :
##D fread("http://stat-computing.org/dataexpo/2009/2008.csv.bz2")
##D 
## End(Not run)

# Reads text input directly :
fread("A,B\n1,2\n3,4")

# Reads pasted input directly :
fread("A,B
1,2
3,4
")

# Finds the first data line automatically :
fread("
This is perhaps a banner line or two or ten.
A,B
1,2
3,4
")

# Detects whether column names are present automatically :
fread("
1,2
3,4
")

# Numerical precision :

DT = fread("A\n1.010203040506070809010203040506\n")
# TODO: add numerals=c("allow.loss", "warn.loss", "no.loss") from base::read.table, +"use.Rmpfr"
typeof(DT$A)=="double"   # currently "allow.loss" with no option

DT = fread("A\n1.46761e-313\n")   # read as 'numeric'
DT[,sprintf("%.15E",A)]   # beyond what double precision can store accurately to 15 digits
# For greater accuracy use colClasses to read as character, then package Rmpfr.

# colClasses
data = "A,B,C,D\n1,3,5,7\n2,4,6,8\n"
fread(data, colClasses=c(B="character",C="character",D="character"))  # as read.csv
fread(data, colClasses=list(character=c("B","C","D")))    # saves typing
fread(data, colClasses=list(character=2:4))     # same using column numbers

# drop
fread(data, colClasses=c("B"="NULL","C"="NULL"))   # as read.csv
fread(data, colClasses=list(NULL=c("B","C")))      #
fread(data, drop=c("B","C"))      # same but less typing, easier to read
fread(data, drop=2:3)             # same using column numbers

# select
# (in read.csv you need to work out which to drop)
fread(data, select=c("A","D"))    # less typing, easier to read
fread(data, select=c(1,4))        # same using column numbers

# skip blank lines
fread("a,b\n1,a\n2,b\n\n\n3,c\n", blank.lines.skip=TRUE)
# fill
fread("a,b\n1,a\n2\n3,c\n", fill=TRUE)
fread("a,b\n\n1,a\n2\n\n3,c\n\n", fill=TRUE)

# fill with skip blank lines
fread("a,b\n\n1,a\n2\n\n3,c\n\n", fill=TRUE, blank.lines.skip=TRUE)

# check.names usage
fread("a b,a b\n1,2\n")
fread("a b,a b\n1,2\n", check.names=TRUE) # no duplicates + syntactically valid names



