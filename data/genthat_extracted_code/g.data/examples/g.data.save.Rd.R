library(g.data)


### Name: g.data.save
### Title: Create and Maintain Delayed-Data Packages
### Aliases: g.data.attach g.data.save g.data.get g.data.put
### Keywords: data

### ** Examples

## Not run: 
##D ddp <- tempfile("newdir")           # Where to put the files
##D g.data.attach(ddp)                  # Warns that this is a new directory
##D assign("m1", matrix(1, 5000, 1000), 2)
##D assign("m2", matrix(2, 5000, 1000), 2)
##D g.data.save()                       # Writes the files
##D detach(2)
##D 
##D g.data.attach(ddp)                  # No warning, because directory exists
##D ls(2)
##D system.time(print(dim(m1)))         # Takes time to load up
##D system.time(print(dim(m1)))         # Second time is faster!
##D find("m1")                          # m1 still lives in pos=2, is now real
##D assign("m3", m1*10, 2)
##D g.data.save()                       # Or just g.data.save(obj="m3")
##D detach(2)
##D 
##D mym2 <- g.data.get("m2", ddp)       # Get one objects without attaching
##D unlink(ddp, recursive=TRUE)         # Clean up this example
## End(Not run)

## Not run: 
##D ddp <- tempfile("newdir")           # New example
##D y <- list(m1=1:1000, m2=2:1001)
##D attach(y)                           # Attach an existing list or dataframe
##D g.data.save(ddp)
##D detach(2)
##D unlink(ddp, recursive=TRUE)         # Clean up this example
## End(Not run)



