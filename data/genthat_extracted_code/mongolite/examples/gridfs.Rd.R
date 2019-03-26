library(mongolite)


### Name: gridfs
### Title: GridFS API
### Aliases: gridfs

### ** Examples

# New GridFS
fs <- gridfs(url = "mongodb+srv://readwrite:test@cluster0-84vdt.mongodb.net/test")
download.file('https://cloud.r-project.org/doc/manuals/r-devel/NEWS.pdf', 'NEWS.pdf', mode = 'wb')
fs$upload('NEWS.pdf')
fs$download('NEWS.pdf', file.path(tempdir(), 'output.pdf'))
con <- file(file.path(tempdir(), 'output2.pdf'))
fs$read('NEWS.pdf', con)
fs$remove('NEWS.pdf')

files <- c('NEWS.pdf', file.path(tempdir(), c('output.pdf', 'output2.pdf')))
hashes <- tools::md5sum(files)
unlink(files)
stopifnot(length(unique(hashes)) == 1)

## No test: 
# Insert Binary Data
fs <- gridfs()
buf <- serialize(nycflights13::flights, NULL)
fs$write(buf, 'flights')
out <- fs$read('flights')
flights <- unserialize(out$data)

tmp <- file.path(tempdir(), 'flights.rds')
fs$download('flights', tmp)
flights2 <- readRDS(tmp)
stopifnot(all.equal(flights, nycflights13::flights))
stopifnot(all.equal(flights2, nycflights13::flights))

# Show what we have
fs$find()
fs$drop()
## End(No test)



