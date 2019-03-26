library(reader)


### Name: force.vec
### Title: returns a vector if 'unknown.data' can in anyway relate to such:
### Aliases: force.vec

### ** Examples

# create a matrix, binary file, and simple vector
my.ids <- paste("ID",1:4,sep="")
my.dat <- sample(2,4,replace=TRUE)
test.files <- c("temp.rda")
mymat <- cbind(my.ids,my.dat)
save(mymat,file=test.files[1])
test.vecs <- list(myvec = my.ids,
 myrda = test.files[1],mymat=mymat)
# show dimensions of each test object
sapply(test.vecs,function(x) {  if(is.null(dim(x))){ length(x)} else {dim(x)}})
# run the function on each, reporting specs of the object returned
for (cc in 1:3) {
  the.vec <- force.vec(test.vecs[[cc]])
  cat(names(test.vecs)[cc],": length() => ",
      length(the.vec),"; is() => ",is(the.vec)[1],"\n",sep="")
}
unlink(test.files)



