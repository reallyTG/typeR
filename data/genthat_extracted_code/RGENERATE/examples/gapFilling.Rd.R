library(RGENERATE)


### Name: gapFilling
### Title: gapFilling
### Aliases: gapFilling gapFilling.data.frame gapFilling.default

### ** Examples


set.seed(122)
NSTEP <- 1000
x <- rnorm(NSTEP)
y <- x+rnorm(NSTEP)
z <- c(rnorm(1),y[-1]+rnorm(NSTEP-1))
df <- data.frame(x=x,y=y,z=z)
var <- VAR(df,type="none")

dfobs <- df
dfobs[20:30,2] <- NA
n <- nrow(df)
gp <- gapFilling(x=dfobs,objectForGeneration=var,max.filling=2)








