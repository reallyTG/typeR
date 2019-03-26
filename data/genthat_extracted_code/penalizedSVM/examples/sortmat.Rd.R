library(penalizedSVM)


### Name: sortmat
### Title: Sort matrix or data frame
### Aliases: sortmat

### ** Examples


m <- matrix(c(9:5, c(1, 4, 3, 3, 5), c(1, 2, 4, 3, 5)), ncol = 3, byrow = FALSE)

print( m)
#    [,1] [,2] [,3]
#[1,]    9    1    1
#[2,]    8    4    2
#[3,]    7    3    4
#[4,]    6    3    3
#[5,]    5    5    5

# sort first according to the second column then if equal according to the third column 
print(m1 <- sortmat(Mat = m, Sort = c(2, 3)))
#     [,1] [,2] [,3]
#[1,]    9    1    1
#[2,]    6    3    3
#[3,]    7    3    4
#[4,]    8    4    2
#[5,]    5    5    5


# sort first according to the third (!)  column then if equal according
# to the second column 
print(m2 <- sortmat(Mat = m, Sort = c(3, 2)))
#     [,1] [,2] [,3]
#[1,]    9    1    1
#[2,]    8    4    2
#[3,]    6    3    3
#[4,]    7    3    4
#[5,]    5    5    5

# Note m1 and m2 are not equal!!!!
all(m1==m2) #FALSE


# in decreasing order
print(m3 <- sortmat(Mat = m, Sort = c(2, 3), decreasing=TRUE))
#     [,1] [,2] [,3]
#[1,]    5    5    5
#[2,]    8    4    2
#[3,]    7    3    4
#[4,]    6    3    3
#[5,]    9    1    1




