library(Publish)


### Name: publish.matrix
### Title: Publishing a matrix in raw, org, latex, or muse format
### Aliases: publish.matrix

### ** Examples


x <- matrix(1:12,ncol=3)
publish(x)

# rounding the numeric part of data mixtures 
y <- cbind(matrix(letters[1:12],ncol=3),x,matrix(rnorm(12),ncol=3))
publish(y,digits=1)

publish(x,inter.lines=list("1"="text between line 1 and line 2",
                          "3"="text between line 3 and line 4"))




