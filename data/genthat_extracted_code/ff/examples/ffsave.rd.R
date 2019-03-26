library(ff)


### Name: ffsave
### Title: Save R and ff objects
### Aliases: ffsave ffsave.image
### Keywords: IO file

### ** Examples

  ## Not run: 
##D   message("let's create some ff objects")
##D   n <- 8e3
##D   a <- ff(sample(n, n, TRUE), vmode="integer", length=n, filename="d:/tmp/a.ff")
##D   b <- ff(sample(255, n, TRUE), vmode="ubyte", length=n, filename="d:/tmp/b.ff")
##D   x <- ff(sample(255, n, TRUE), vmode="ubyte", length=n, filename="d:/tmp/x.ff")
##D   y <- ff(sample(255, n, TRUE), vmode="ubyte", length=n, filename="d:/tmp/y.ff")
##D   z <- ff(sample(255, n, TRUE), vmode="ubyte", length=n, filename="d:/tmp/z.ff")
##D   df <- ffdf(x=x, y=y, z=z)
##D   rm(x,y,z)
##D 
##D   message("save all of them")
##D   ffsave.image("d:/tmp/x")
##D   str(ffinfo("d:/tmp/x"))
##D 
##D   message("save some of them with shorter relative pathnames ...")
##D   ffsave(a, b, file="d:/tmp/y", rootpath="d:/tmp")
##D   str(ffinfo("d:/tmp/y"))
##D 
##D   message("... and add others later")
##D   ffsave(df, add=TRUE, file="d:/tmp/y", rootpath="d:/tmp")
##D   str(ffinfo("d:/tmp/y"))
##D 
##D   message("... and add others later")
##D   system.time(ffsave(a, file="d:/tmp/z", move=TRUE))
##D   ffinfo("d:/tmp/z")
##D 
##D   message("let's delete/close/remove all objects")
##D   close(a)  # no file anymore, since we moved a into the ffarchive
##D   delete(b, df)
##D   rm(df, a, b, n)
##D   message("prove it")
##D   ls()
##D 
##D   message("restore all but ff files in a different directory")
##D   system.time(ffload("d:/tmp/x", rootpath="d:/tmp2"))
##D   lapply(ls(), function(i)filename(get(i)))
##D 
##D   delete(a, b, df)
##D   rm(df, a, b)
##D 
##D   ffdrop(c("d:/tmp/x", "d:/tmp/y", "d:/tmp/z"))
##D   
## End(Not run)



