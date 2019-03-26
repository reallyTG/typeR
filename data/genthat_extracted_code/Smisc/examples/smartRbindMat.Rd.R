library(Smisc)


### Name: smartRbindMat
### Title: Row bind matrices whose column names may not be the same
### Aliases: smartRbindMat
### Keywords: misc

### ** Examples

x <- matrix(rnorm(6), ncol = 2, dimnames = list(letters[1:3],letters[4:5]))
y <- matrix(rnorm(6), ncol = 3, dimnames = list(letters[7:8],letters[4:6]))
z <- matrix(rnorm(2), nrow = 1, dimnames = list("c",letters[3:4]))

x
y
z

smartRbindMat(x,y,z)
smartRbindMat(list(x, y, z), distinguish = TRUE)
smartRbindMat(y,z,x, distinguish = TRUE)
smartRbindMat(c("y","x","z"), filler = -20, distinguish = TRUE)

w1 <- matrix(sample(letters[1:26], 6), ncol = 2,
             dimnames = list(c("3", "", "4"), c("w", "v")))
x1 <- matrix(sample(letters[1:26], 6), ncol = 2,
             dimnames = list(NULL, letters[4:5]))
y1 <- matrix(sample(letters[1:26], 6), ncol = 3,
             dimnames = list(NULL, letters[4:6]))
z1 <- matrix(sample(letters[1:26], 2), nrow = 1,
             dimnames = list(NULL, letters[3:4]))

w1
x1
y1
z1

smartRbindMat(w1,x1,y1,z1)
smartRbindMat(list(w1 = w1, x1 = x1, y1 = y1, z1 = z1), distinguish = TRUE)

smartRbindMat(w1,x1,y,z1,z)
smartRbindMat(w1,x1,y,z1,z, distinguish = TRUE)




