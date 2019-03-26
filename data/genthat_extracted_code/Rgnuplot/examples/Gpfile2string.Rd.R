library(Rgnuplot)


### Name: Gpfile2string
### Title: Read a text file to a string
### Aliases: Gpfile2string
### Keywords: programming

### ** Examples

#"Hello World!" - loading and executing a gnuplot script from Rgnuplot
#Initialize the gnuplot handle
h1<-Gpinit()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
Gpsetloadpath(h1)
## Not run: 
##D #the filename has Rgnuplot's extdata path
##D gpfile <- system.file(package='Rgnuplot') ##D 
##D #load script into a string
##D s<-Gpfile2string(gpfile)
##D #send gnuplot commands
##D Gpcmd(h1,s)
##D #pause R and gnuplot
##D Gppause()
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



