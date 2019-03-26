library(lavaSearch2)


### Name: var2dummy
### Title: Convert Variable Names to Dummy Variables Names.
### Aliases: var2dummy var2dummy.list var2dummy.lvm
### Keywords: internal

### ** Examples


## Not run: 
##D var2dummy <- lavaSearch2:::var2dummy
##D var2dummy.list <- lavaSearch2:::var2dummy.list
##D var2dummy.lvm <- lavaSearch2:::var2dummy.lvm
##D 
##D m <- lvm()
##D regression(m) <- c(y1,y2,y3)~u
##D regression(m) <- u ~ X1+X2
##D var2dummy(m, var = c("X1","X2"))
##D categorical(m,labels=c("M","F","MF")) <- ~X1
##D var2dummy(m, var = c("X1","X2"))
##D categorical(m,labels=c("1","2","3")) <- ~X2
##D var2dummy(m, var = c("X1","X2"))
## End(Not run)




