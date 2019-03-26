library(ff)


### Name: as.ff
### Title: Coercing ram to ff and ff to ram objects
### Aliases: as.ff as.ff.default as.ff.ff as.ram as.ram.default as.ram.ff
### Keywords: IO data

### ** Examples

   message("create ff")
   myintff <- ff(1:12)
   message("coerce (=clone) integer ff to double ff")
   mydoubleff <- as.ff(myintff, vmode="double")
   message("cache (=clone) integer ff to integer ram AND close original ff")
   myintram <- as.ram(myintff) # filename is retained
   close(myintff)
   message("modify ram cache and write back (=clone) to ff")
   myintram[1] <- -1L
   myintff <- as.ff(myintram, overwrite=TRUE)
   message("coerce (=clone) integer ram to double ram")
   mydoubleram <- as.ram(myintram, vmode="double")
   message("coerce (inplace) integer ram to double ram")
   myintram <- as.ram(myintram, vmode="double")
   message("more classic: coerce (inplace) double ram to integer ram")
   vmode(myintram) <- "integer"
   rm(myintff, myintram, mydoubleff, mydoubleram); gc()



