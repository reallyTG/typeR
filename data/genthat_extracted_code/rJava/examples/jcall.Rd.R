library(rJava)


### Name: jcall
### Title: Call a Java method
### Aliases: .jcall
### Keywords: interface

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)
.jcall("java/lang/System","S","getProperty","os.name")
if (!nzchar(Sys.getenv("NOAWT"))) {
  f <- .jnew("java/awt/Frame","Hello")
  .jcall(f,,"setVisible",TRUE)
}



