library(R.utils)


### Name: compressFile
### Title: Compressing and decompressing files
### Aliases: compressFile.default compressFile decompressFile
###   decompressFile.default isCompressedFile isCompressedFile.default
###   bzip2 bzip2.default bunzip2 bunzip2.default isBzipped
###   isBzipped.default gzip gzip.default gunzip gunzip.default isGzipped
###   isGzipped.default
### Keywords: file programming

### ** Examples

  ## bzip2
  cat(file="foo.txt", "Hello world!")
  print(isBzipped("foo.txt"))
  print(isBzipped("foo.txt.bz2"))

  bzip2("foo.txt")
  print(file.info("foo.txt.bz2"))
  print(isBzipped("foo.txt"))
  print(isBzipped("foo.txt.bz2"))

  bunzip2("foo.txt.bz2")
  print(file.info("foo.txt"))

  ## gzip
  cat(file="foo.txt", "Hello world!")
  print(isGzipped("foo.txt"))
  print(isGzipped("foo.txt.gz"))

  gzip("foo.txt")
  print(file.info("foo.txt.gz"))
  print(isGzipped("foo.txt"))
  print(isGzipped("foo.txt.gz"))

  gunzip("foo.txt.gz")
  print(file.info("foo.txt"))

  ## Cleanup
  file.remove("foo.txt")



