library(splitstackshape)


### Name: splitstackshape-package
### Title: splitstackshape
### Aliases: splitstackshape-package splitstackshape
### Keywords: package

### ** Examples


## concat.split
head(cSplit(concat.test, "Likes", drop = TRUE))

## Reshape
set.seed(1)
mydf <- data.frame(id_1 = 1:6, id_2 = c("A", "B"), varA.1 = sample(letters, 6),
                   varA.2 = sample(letters, 6), varA.3 = sample(letters, 6),
                   varB.2 = sample(10, 6), varB.3 = sample(10, 6), 
                   varC.3 = rnorm(6))
mydf
Reshape(mydf, id.vars = c("id_1", "id_2"),
        var.stubs = c("varA", "varB", "varC"))

## Stacked
Stacked(data = mydf, id.vars = c("id_1", "id_2"),
        var.stubs = c("varA", "varB", "varC"),
        sep = ".")
## Not run: 
##D ## Processing times
##D set.seed(1)
##D Nrow <- 1000000
##D Ncol <- 10
##D mybigdf <- cbind(id = 1:Nrow, as.data.frame(matrix(rnorm(Nrow*Ncol),
##D                                                    nrow=Nrow)))
##D head(mybigdf)
##D dim(mybigdf)
##D tail(mybigdf)
##D A <- names(mybigdf)
##D names(mybigdf) <- c("id", paste("varA", 1:3, sep = "_"),
##D                     paste("varB", 1:4, sep = "_"),
##D                     paste("varC", 1:3, sep = "_"))
##D system.time({
##D    O1 <- Reshape(mybigdf, id.vars = "id",
##D    var.stubs = c("varA", "varB", "varC"), sep = "_")
##D    O1 <- O1[order(O1$id, O1$time), ]
##D })
##D system.time({
##D    O2 <- merged.stack(mybigdf, id.vars="id",
##D    var.stubs=c("varA", "varB", "varC"), sep = "_")
##D })
##D system.time({
##D    O3 <- Stacked(mybigdf, id.vars="id",
##D    var.stubs=c("varA", "varB", "varC"), sep = "_")
##D })
##D DT <- data.table(mybigdf)
##D system.time({
##D    O4 <- merged.stack(DT, id.vars="id",
##D    var.stubs=c("varA", "varB", "varC"), sep = "_")
##D })
## End(Not run)




