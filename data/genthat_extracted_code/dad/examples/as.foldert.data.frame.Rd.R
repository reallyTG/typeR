library(dad)


### Name: as.foldert.data.frame
### Title: Data frame to foldert
### Aliases: as.foldert.data.frame

### ** Examples

# First example: method = 1

times <- as.Date(c("2017-03-01", "2017-04-01", "2017-05-01"))
x1 <- data.frame(t=times[1], ind=1:6,
                 f=c("a","a","a","b","b","b"), z1=rep(0,6), z2=rep(0,6))
x2 <- data.frame(t=times[2], ind=c(1,4,6),
                 f=c("a","b","b"), z1=rnorm(3,1,1), z2=rnorm(3,3,2))
x3 <- data.frame(t=times[3], ind=c(1,3:6),
                 f=c("a","a","a","b","b"), z1=rnorm(5,3,2), z2=rnorm(5,6,3))
x <- rbind(x1, x2, x3)

ft1 <- as.foldert(x, method = 1, ind = "ind", timecol = "t", same.rows = TRUE)
print(ft1)

ft2 <- as.foldert(x, method = 1, ind = "ind", timecol = "t", same.rows = FALSE)
print(ft2)

data(castles.dated)
periods <- castles.dated$periods
stones <- castles.dated$stones
stones$stone <- rownames(stones)

castledf <- merge(periods, stones, by = "castle")
castledf$period <- as.numeric(castledf$period)
castledf$stone <- as.factor(paste(as.character(castledf$castle),
                            as.character(castledf$stone), sep = "_"))

castfoldt1 <- as.foldert(castledf, method = 1, ind = "stone", timecol = "period",
                         same.rows = FALSE)
summary(castfoldt1)


# Second example: method = 2

times <- as.Date(c("2017-03-01", "2017-04-01", "2017-05-01"))
y1 <- data.frame(z1=rep(0,6), z2=rep(0,6))
y2 <- data.frame(z1=rnorm(6,1,1), z2=rnorm(6,3,2))
y3 <- data.frame(z1=rnorm(6,3,2), z2=rnorm(6,6,3))
y <- cbind(ind = 1:6, y1, y2, y3)

ft3 <- as.foldert(y, method = 2, ind = "ind", timecol = 2, nvar = 2)
print(ft3)



