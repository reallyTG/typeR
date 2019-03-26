### R code from vignette source 'g.data.Rnw'

###################################################
### code chunk number 1: g.data.Rnw:13-15
###################################################
options(width=80, digits=4, scipen=5)
if ("package:g.data" %in% search()) detach("package:g.data")             # So it will be in pos=2


###################################################
### code chunk number 2: g.data.Rnw:32-39
###################################################
require(g.data)
(ddp <- tempfile("newdir"))                     # Where to put the files
g.data.attach(ddp)                  # Warns that this is a new directory
search()[1:3]
assign("m1", matrix(1, 5000, 1000), 2)
assign("m2", matrix(2, 5000, 1000), 2)
ls(2)


###################################################
### code chunk number 3: g.data.Rnw:43-45
###################################################
g.data.save()                                         # Writes the files
detach(2)


###################################################
### code chunk number 4: g.data.Rnw:52-57
###################################################
g.data.attach(ddp)                # No warning, because directory exists
ls(2)
system.time(print(dim(m1)))                      # Takes time to load up
system.time(print(dim(m1)))                     # Second time is faster!
find("m1")                        # m1 still lives in pos=2, is now real


###################################################
### code chunk number 5: g.data.Rnw:60-63
###################################################
assign("m3", m1*10, 2)
g.data.save()                            # Or just g.data.save(obj="m3")
detach(2)


###################################################
### code chunk number 6: g.data.Rnw:68-69
###################################################
mym2 <- g.data.get("m2", ddp)         # Get one object without attaching


###################################################
### code chunk number 7: g.data.Rnw:72-73
###################################################
g.data.put("m4", matrix(1:12, 3,4), ddp)


###################################################
### code chunk number 8: g.data.Rnw:76-77
###################################################
unlink(ddp, recursive=TRUE)                      # Clean up this example


###################################################
### code chunk number 9: g.data.Rnw:83-91
###################################################
ddp <- tempfile("newdir")
y <- list(m1=1:1000, m2=2:1001)
attach(y)                         # Attach an existing list or dataframe
search()[1:3]
ls(2)
g.data.save(ddp)
detach(2)
unlink(ddp, recursive=TRUE)                      # Clean up this example


