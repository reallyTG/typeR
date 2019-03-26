library(mvbutils)


### Name: source.mvb
### Title: Read R code and data from a file or connection
### Aliases: source.mvb current.source from.here
### Keywords: misc

### ** Examples

# You wouldn"t normally do it like this:
tt <- tempfile()
cat( "data <- scan( current.source(), what=list( x=0, y=0))",
"27 3",
"35 5",
file=tt, sep="\n")
source.mvb( tt)
unlink( tt)
data # list( x=c( 27, 35), y=c(3, 5))
# "current.source", useful for hacking:
tt <- tempfile()
cat( "cat( \"This code is being read from file\",",
"summary( current.source())$description)", file=tt)
source.mvb( tt)
cat( "\nTo prove the point:\n")
cat( scan( tt, what="", sep="\n"), sep="\n")
unlink( tt)



