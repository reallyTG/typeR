library(lavaSearch2)


### Name: modelsearch2
### Title: Data-driven Extension of a Latent Variable Model
### Aliases: modelsearch2 modelsearch2.lvmfit

### ** Examples


## simulate data
mSim <- lvm()
regression(mSim) <- c(y1,y2,y3,y4)~u
regression(mSim) <- u~x1+x2
categorical(mSim,labels=c("A","B","C")) <- "x2"
latent(mSim) <- ~u
covariance(mSim) <- y1~y2
transform(mSim, Id~u) <- function(x){1:NROW(x)}
df.data <- lava::sim(mSim, n = 1e2, latent = FALSE)

## only identifiable extensions
m <- lvm(c(y1,y2,y3,y4)~u)
latent(m) <- ~u
addvar(m) <- ~x1+x2

e <- estimate(m, df.data)

## Not run: 
##D resSearch <- modelsearch(e)
##D resSearch
##D 
##D resSearch2 <- modelsearch2(e, nStep = 2)
##D resSearch2
## End(Not run)
## Don't show: 
search.link <- c("u~x1","u~x2","y1~x1","y1~x2","y1~~y2","y1~~y3")
resSearch2 <- modelsearch2(e, nStep = 2, link = search.link)
resSearch2
## End(Don't show)

## some extensions are not identifiable
m <- lvm(c(y1,y2,y3)~u)
latent(m) <- ~u
addvar(m) <- ~x1+x2 

e <- estimate(m, df.data)

## Not run: 
##D resSearch <- modelsearch(e)
##D resSearch
##D resSearch2 <- modelsearch2(e)
##D resSearch2
## End(Not run)

## for instance
mNI <- lvm(c(y1,y2,y3)~u)
latent(mNI) <- ~u
covariance(mNI) <- y1~y2
## estimate(mNI, data = df.data)
## does not converge






