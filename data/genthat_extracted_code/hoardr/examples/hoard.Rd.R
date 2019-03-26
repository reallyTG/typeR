library(hoardr)


### Name: hoard
### Title: hoardr class
### Aliases: hoard

### ** Examples

(x <- hoard())
x$cache_path_set(path = "foobar", type = 'tempdir')
x
x$path
x$cache_path_get()

# Or you can set the full path directly with `full_path`
mydir <- file.path(tempdir(), "foobar")
x$cache_path_set(full_path = mydir)
x
x$path
x$cache_path_get()

# make the directory if doesn't exist already
x$mkdir()

# list files in dir
x$list()
cat(1:10000L, file = file.path(x$cache_path_get(), "foo.txt"))
x$list()

# add more files
cat(letters, file = file.path(x$cache_path_get(), "foo2.txt"))
cat(LETTERS, file = file.path(x$cache_path_get(), "foo3.txt"))

# see if files exist
x$exists("foo.txt") # exists
x$exists(c("foo.txt", "foo3.txt")) # both exist
x$exists(c("foo.txt", "foo3.txt", "stuff.txt")) # one doesn't exist

# cache details
x$details()

# delete files by name - we prepend the base path for you
x$delete("foo.txt")
x$list()
x$details()

# delete all files
cat("one\ntwo\nthree", file = file.path(x$cache_path_get(), "foo.txt"))
cat("asdfasdf asd fasdf", file = file.path(x$cache_path_get(), "bar.txt"))
x$delete_all()
x$list()

# make/get a key for a file
cat(1:10000L, file = file.path(x$cache_path_get(), "foo.txt"))
x$keys()
x$key(x$list()[1])

# as files
Map(function(z) z$exists(), x$files())

# compress and uncompress
x$compress()
x$uncompress()

# reset cache path
x$cache_path_set(path = "stuffthings", type = "tempdir")
x
x$cache_path_get()
x$list()

# cleanup
unlink(x$cache_path_get())



