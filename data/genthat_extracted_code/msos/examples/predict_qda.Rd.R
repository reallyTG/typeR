library(msos)


### Name: predict_qda
### Title: Quadratic discrimination prediction
### Aliases: predict_qda

### ** Examples


# Load Iris Data
data(iris)

# Build data
x.iris <- as.matrix(iris[,1:4])
n <- nrow(x.iris)
# Gets group vector (1, ... , 1, 2, ..., 2, 3, ... , 3)
y.iris <- rep(1:3, c(50, 50, 50)) 

# Perform QDA
qd.iris <- qda(x.iris, y.iris)
yhat.qd <- NULL
for (i in seq_len(n)) {
 yhat.qd <- c(yhat.qd, imax(predict_qda(qd.iris,x.iris[i,])))
}
table(yhat.qd,y.iris)




