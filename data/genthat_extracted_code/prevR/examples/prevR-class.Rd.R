library(prevR)


### Name: prevR-class
### Title: Objects of class prevR.
### Aliases: prevR-class
### Keywords: classes

### ** Examples

showClass("prevR")

col <- c(id = "cluster", 
        x = "x",
        y="y",
        n="n",
        pos = "pos",
        c.type = "residence",
        wn="weighted.n",
        wpos="weighted.pos"
)
dhs <- as.prevR(fdhs.clusters,col, fdhs.boundary)
str(dhs)
print(dhs)

## Not run: 
##D  dhs <- rings(fdhs,N=c(100,300,500))
##D  str(dhs)
##D  print(dhs)
## End(Not run)



