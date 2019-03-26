library(disto)


### Name: `[<-.disto`
### Title: In-place replacement of values
### Aliases: `[<-.disto` [<-.disto

### ** Examples

temp       <- stats::dist(iris[,1:4])
dio        <- disto(objectname = "temp")
names(dio) <- paste0("a", 1:150)
dio

dio[1, 2] <- 10
dio[1,2]

dio[1:10, 2:11] <- 100
dio[1:10, 2:11, product = "inner"]

dio[paste0("a", 1:5), paste0("a", 6:10)] <- 101
dio[paste0("a", 1:5), paste0("a", 6:10), product = "inner"]



