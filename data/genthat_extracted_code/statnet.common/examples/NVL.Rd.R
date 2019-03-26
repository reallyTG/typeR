library(statnet.common)


### Name: NVL
### Title: Convenience functions for handling 'NULL' objects.
### Aliases: NVL NVL2 NVL3 NVL<-
### Keywords: utilities

### ** Examples

a <- NULL

a # NULL
NVL(a,0) # 0

b <- 1

b # 1
NVL(b,0) # 1

# Here, object x does not exist, but since b is not NULL, x is
# never evaluated, so the statement finishes.
NVL(b,x) # 1

# Also,
NVL(NULL,1,0) # 1
NVL(NULL,0,1) # 0
NVL(NULL,NULL,0) # 0
NVL(NULL,NULL,NULL) # NULL

NVL2(a, "not null!", "null!") # "null!"
NVL2(b, "not null!", "null!") # "not null!"

NVL3(a, "not null!", "null!") # "null!"
NVL3(b, .+1, "null!") # 2

NVL(a) <- 2
a # 2
NVL(b) <- 2
b # still 1



