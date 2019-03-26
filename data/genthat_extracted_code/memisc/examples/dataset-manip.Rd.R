library(memisc)


### Name: data.set manipulation
### Title: Manipulation of Data Sets
### Aliases: subset,data.set-method unique,data.set-method
###   merge,data.set,data.set-method merge,data.set,data.frame-method
###   merge,data.frame,data.set-method cbind.data.set rbind.data.set

### ** Examples

ds1 <- data.set(
      a = rep(1:3,5),
      b = rep(1:5,each=3)
  )
ds2 <- data.set(
      a = c(3:1,3,3),
      b = 1:5
  )

ds1 <- within(ds1,{
      description(a) <- "Example variable 'a'"
      description(b) <- "Example variable 'b'"
  })

ds2 <- within(ds2,{
      description(a) <- "Example variable 'a'"
      description(b) <- "Example variable 'b'"
  })

str(ds3 <- rbind(ds1,ds2))
description(ds3)

ds3 <- within(ds1,{
        c <- a
        d <- b
        description(c) <- "Copy of variable 'a'"
        description(d) <- "Copy of variable 'b'"
        rm(a,b)
    })
str(ds4 <- cbind(ds1,ds3))
description(ds4)

ds5 <- data.set(
        c = 1:3,
        d = c(1,1,2)
        )
ds5 <- within(ds5,{
      description(c) <- "Example variable 'c'"
      description(d) <- "Example variable 'd'"
  })
str(ds6 <- merge(ds1,ds5,by.x="a",by.y="c"))

# Note that the attributes of the left-hand variables
# have priority.
description(ds6)



